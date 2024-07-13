part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required RequestState state,
    required String message,
    required String email,
    required String password,
  }) = _SignInFormState;

  factory SignInFormState.initial() => const SignInFormState(
        state: RequestState.empty,
        message: '',
        email: '',
        password: '',
      );
}



