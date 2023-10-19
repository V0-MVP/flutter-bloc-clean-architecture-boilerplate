part of 'authenticator_watcher_bloc.dart';

@freezed
class AuthenticatorWatcherState with _$AuthenticatorWatcherState {
  const factory AuthenticatorWatcherState.initial() = _Initial;
  const factory AuthenticatorWatcherState.authenticating() = _Authenticating;
  const factory AuthenticatorWatcherState.authenticated() = _Authenticated;
  const factory AuthenticatorWatcherState.unauthenticated() = _Unauthenticated;
  const factory AuthenticatorWatcherState.isFirstTime() = _IsFirstTime;
}
