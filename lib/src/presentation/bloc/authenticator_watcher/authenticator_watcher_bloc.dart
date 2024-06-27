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
            prefs.setString(ONBOARDING,ONBOARDING);
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
