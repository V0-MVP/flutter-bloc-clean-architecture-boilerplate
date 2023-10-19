part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormEvent with _$SignInFormEvent {
   const factory SignInFormEvent.initial() = _Initial;
  const factory SignInFormEvent.signInWithEmail() = _SignInWithEmail;

  // TextField events
  const factory SignInFormEvent.emailOnChanged(
    String email,
  ) = _EmailOnChanged;
  const factory SignInFormEvent.passwordOnChanged(
    String password,
  ) = _PasswordOnChanged;
}