part of 'authenticator_watcher_bloc.dart';

@freezed
class AuthenticatorWatcherEvent with _$AuthenticatorWatcherEvent {
  const factory AuthenticatorWatcherEvent.authCheckRequest() = _AuthCheckRequest;
  const factory AuthenticatorWatcherEvent.signOut() = _SignOut;
}