import 'package:bloc_clean_architecture/src/comman/enum.dart';
import 'package:bloc_clean_architecture/src/domain/usecase/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  SignInFormBloc(this._signInWithEmail) : super(SignInFormState.initial()) {
    on<SignInFormEvent>(
      (event, emit) async {
        await event.map(
          initial: (_) {
            emit(SignInFormState.initial());
          },
          signInWithEmail: (_) async {
            emit(state.copyWith(state: RequestState.loading));
          await Future.delayed(Duration(seconds: 2));
            final result = await _signInWithEmail.execute(
              state.email,
              state.password,
            );
            result.fold(
                (f) => emit(
                      state.copyWith(
                        state: RequestState.error,
                        message: f.message,
                      ),
                    ),
                (_) => emit(state.copyWith(state: RequestState.loaded)));
          },
          emailOnChanged: (event) {
            emit(state.copyWith(email: event.email, state: RequestState.empty));
          },
          passwordOnChanged: (event) {
            emit(state.copyWith(
                password: event.password, state: RequestState.empty));
          },
        );
      },
    );
  }

  final SignIn _signInWithEmail;
}
