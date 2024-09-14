## 📑 Internal Code Documentation

### 📚 Table of Contents

1. **Introduction**
2. **Core Functionality**
3. **Dependency Injection**
4. **App Initialization**
5. **Main Application Widget (MyApp)**
6. **Theme Management**
7. **Routing**

### 1. Introduction

This code implements a Flutter application built with a clean architecture approach leveraging Bloc and Cubit libraries for state management. It demonstrates a well-structured project setup with dependency injection, theme management, and a router for navigation.

### 2. Core Functionality

The application features the following core functionalities:

| Feature | Description |
|---|---|
| **Authentication** | Manages user authentication through `AuthenticatorWatcherBloc`. |
| **Sign In** | Allows users to sign in with `SignInFormBloc`. |
| **Theme Switching** | Enables users to toggle between light and dark themes using `ThemeCubit`. |
| **Routing** | Provides navigation between different application screens using `GoRouter`. |

### 3. Dependency Injection

The application utilizes dependency injection to manage dependencies and promote modularity.

* **Dependency Injection Container:**  The `injection.dart` file contains the dependency injection container (`di.locator`) using a library like `get_it`.
* **Dependency Registration:**  All necessary dependencies are registered in the `injection.dart` file, ensuring proper initialization and access throughout the application.
* **Injection Usage:**  The `di.locator` is used to fetch dependencies within the application, such as in `MultiBlocProvider` and other components.

### 4. App Initialization

The `main()` function initializes the application by:

* Ensuring Flutter widgets are initialized: `WidgetsFlutterBinding.ensureInitialized()`.
* Setting a sequential bloc concurrency strategy: `Bloc.transformer = bloc_concurrency.sequential()`.
* Registering the `AppBlocObserver` for observing bloc events: `Bloc.observer = const AppBlocObserver()`.
* Initializing the dependency injection container: `di.init()`.
* Running the application: `runApp(const MyApp())`.

### 5. Main Application Widget (MyApp)

The `MyApp` widget is the root widget of the application. It:

* Provides a `MultiBlocProvider` for managing multiple blocs:
    * `AuthenticatorWatcherBloc`: Watches for authentication state changes.
    * `SignInFormBloc`: Manages the sign-in form.
    * `ThemeCubit`: Manages theme switching.
* Uses `MaterialApp.router` for routing:
    * Disables the debug banner: `debugShowCheckedModeBanner: false`.
    * Sets the application title: `title: 'flutter bloc clean architecture'`.
    * Configures light and dark themes: `theme` and `darkTheme`.
    * Uses system theme mode: `themeMode: ThemeMode.system`.
    * Initializes the router: `routerConfig: routerinit`.

### 6. Theme Management

The application uses a `ThemeCubit` to manage theme switching between light and dark modes:

* **ThemeCubit:** The `ThemeCubit` handles the current theme state and provides methods for changing the theme.
* **ThemeData:** The `themeLight(context)` and `themeDark(context)` functions define the light and dark theme styles, respectively.
* **Theme Mode:** `ThemeMode.system` ensures the theme follows the system settings.

### 7. Routing

The application uses `GoRouter` to manage navigation between different screens:

* **Router Initialization:** The `routerinit` variable, initialized in `go_router_init.dart`, defines the application's routes and associated screens.
* **Routing Configuration:** The `routerConfig` property within `MaterialApp.router` is used to configure the router.

**Note:** The specific implementation details of the routes and screens are not included in this documentation. However, the basic structure and purpose are outlined.
