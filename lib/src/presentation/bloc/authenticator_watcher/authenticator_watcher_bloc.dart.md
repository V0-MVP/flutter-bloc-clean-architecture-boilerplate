# Authenticator Watcher Bloc Documentation

## Table of Contents
* [Introduction](#introduction)
* [State Management](#state-management)
    * [AuthenticatorWatcherState](#authenticatorwatcherstate)
* [Events](#events)
    * [AuthenticatorWatcherEvent](#authenticatorwatcherevent)
* [Bloc Class](#bloc-class)
    * [AuthenticatorWatcherBloc](#authenticatorwatcherbloc)

## Introduction

This code implements a `AuthenticatorWatcherBloc` in Flutter using the `bloc` package for managing authentication state within the application. The bloc effectively monitors and manages the user's authentication status, allowing for seamless transitions between different authentication states.

## State Management

### AuthenticatorWatcherState

The `AuthenticatorWatcherState` class represents the possible authentication states the application can be in. It is defined using the `freezed` package for a more concise and type-safe representation. 

**State Definitions:**

| State | Description |
|---|---|
| `initial` |  The initial state of the bloc, signifying that authentication has not yet been checked. |
| `authenticating` |  Represents the state when the bloc is currently checking authentication status. |
| `authenticated` |  Indicates that the user is authenticated and has a valid access token. |
| `unauthenticated` |  Indicates that the user is not authenticated or the access token is invalid. |
| `isFirstTime` |  Indicates that the user is accessing the app for the first time and needs to go through onboarding. |

## Events

### AuthenticatorWatcherEvent

The `AuthenticatorWatcherEvent` class defines the possible events that can trigger state changes in the `AuthenticatorWatcherBloc`. It is also defined using the `freezed` package for type-safe event handling.

**Event Definitions:**

| Event | Description |
|---|---|
| `authCheckRequest` |  Triggers the bloc to check the user's authentication status by retrieving and validating the access token. |
| `signOut` |  Triggers the bloc to sign out the user by removing the access token from storage. |

## Bloc Class

### AuthenticatorWatcherBloc

The `AuthenticatorWatcherBloc` class extends the `Bloc` class and handles the authentication state management within the application. It listens for `AuthenticatorWatcherEvent` events and updates the application's authentication state accordingly.

**Functionality:**

* **Constructor:**
    * Initializes the bloc with the `initial` state.
    * Defines an `on` listener for `AuthenticatorWatcherEvent` events.
* **Event Handling:**
    * **`authCheckRequest` Event:**
        * Emits the `authenticating` state.
        * Retrieves the access token and onboarding status from SharedPreferences.
        * If there is no onboarding status, it sets it and emits the `isFirstTime` state.
        * If the access token exists, it emits the `authenticated` state.
        * If the access token does not exist, it emits the `unauthenticated` state.
    * **`signOut` Event:**
        * Emits the `authenticating` state.
        * Removes the access token from SharedPreferences.
        * Emits the `unauthenticated` state.

**Code Example:**

```dart
import 'package:bloc_clean_architecture/main.dart';
import 'package:bloc_clean_architecture/src/comman/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authenticator_watcher_event.dart';
part 'authenticator_watcher_state.dart';
part 'authenticator_watcher_bloc.freezed.dart';

class AuthenticatorWatcherBloc
    extends Bloc<AuthenticatorWatcherEvent, AuthenticatorWatcherState> {
  AuthenticatorWatcherBloc()
      : super(const AuthenticatorWatcherState.initial()) {
    on<AuthenticatorWatcherEvent>((event, emit) async {
      await event.map(
        authCheckRequest: (_) async {
          emit(const AuthenticatorWatcherState.authenticating());
          final prefs = await SharedPreferences.getInstance();
          final token = prefs.getString(ACCESS_TOKEN);
          final showOnbording = prefs.getString(ONBOARDING);
          if (showOnbording == null) {
            prefs.setString(ONBOARDING, ONBOARDING);
            emit(const AuthenticatorWatcherState.isFirstTime());
          } else 
          if (token != null) {
            emit(const AuthenticatorWatcherState.authenticated());
          } else {
            emit(const AuthenticatorWatcherState.unauthenticated());
          }
        },
        signOut: (_) async {
          emit(const AuthenticatorWatcherState.authenticating());
          final prefs = await SharedPreferences.getInstance();
          prefs.remove(ACCESS_TOKEN);
          emit(const AuthenticatorWatcherState.unauthenticated());
        },
      );
    });
  }
}
```

**Usage:**

The `AuthenticatorWatcherBloc` can be used in any part of the application that needs to monitor and react to authentication changes. It can be initialized and provided to the app using the `BlocProvider` widget from the `flutter_bloc` package. The state of the bloc can be accessed using the `Bloc.state` method, and events can be dispatched using the `Bloc.add` method.

**Example:**

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_clean_architecture/src/features/auth/data/auth_repository.dart';
import 'package:bloc_clean_architecture/src/features/auth/presentation/bloc/authenticator_watcher_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticatorWatcherBloc(authRepository: context.read<AuthRepository>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
        ),
        body: BlocBuilder<AuthenticatorWatcherBloc, AuthenticatorWatcherState>(
          builder: (context, state) {
            if (state is Authenticated) {
              return const Text('Authenticated');
            } else if (state is Unauthenticated) {
              return const Text('Unauthenticated');
            } else if (state is IsFirstTime) {
              return const Text('First Time');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
```

This example shows how to use the `AuthenticatorWatcherBloc` to display different content depending on the user's authentication state.

**Benefits:**

* **Clean Code:** Separates authentication logic from UI code.
* **Testability:** Easy to test the bloc in isolation.
* **Maintainability:** Easier to update and modify authentication logic.
* **Reusability:** Can be reused in different parts of the application.
