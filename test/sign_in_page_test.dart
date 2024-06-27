import 'package:bloc_clean_architecture/src/presentation/page/auth/sign_in_screen.dart';
import 'package:bloc_clean_architecture/src/presentation/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_clean_architecture/src/presentation/bloc/sign_in_form/sign_in_form_bloc.dart';

// Mocking the SignInFormBloc
class MockSignInFormBloc extends MockBloc<SignInFormEvent, SignInFormState> implements SignInFormBloc {}

class FakeSignInFormEvent extends Fake implements SignInFormEvent {}

class FakeSignInFormState extends Fake implements SignInFormState {}

void main() {
  late MockSignInFormBloc mockSignInFormBloc;

  setUpAll(() {
    registerFallbackValue(FakeSignInFormEvent());
    registerFallbackValue(FakeSignInFormState());
  });

  setUp(() {
    mockSignInFormBloc = MockSignInFormBloc();
  });

  tearDown(() {
    mockSignInFormBloc.close();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<SignInFormBloc>(
        create: (_) => mockSignInFormBloc,
        child: const SignInPage(),
      ),
    );
  }

  testWidgets('SignInPage displays correctly', (WidgetTester tester) async {
    // Arrange
    when(() => mockSignInFormBloc.state).thenReturn(SignInFormState.initial());

    // Act
    await tester.pumpWidget(createWidgetUnderTest());

    // Assert
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
  });

  testWidgets('Tapping the eye icon toggles obscure text', (WidgetTester tester) async {
    // Arrange
    when(() => mockSignInFormBloc.state).thenReturn(SignInFormState.initial());

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.tap(find.byIcon(FontAwesomeIcons.eye));
    await tester.pump();

    // Assert
    expect(find.byIcon(FontAwesomeIcons.eyeSlash), findsOneWidget);

    // Act
    await tester.tap(find.byIcon(FontAwesomeIcons.eyeSlash));
    await tester.pump();

    // Assert
    expect(find.byIcon(FontAwesomeIcons.eye), findsOneWidget);
  });

  testWidgets('Form validation and sign in event trigger', (WidgetTester tester) async {
    // Arrange
    when(() => mockSignInFormBloc.state).thenReturn(SignInFormState.initial());

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.enterText(find.byType(CustomTextFormField).first, 'test@test.com');
    await tester.enterText(find.byType(CustomTextFormField).last, 'password');
    await tester.tap(find.text('Sign In'));
    await tester.pump();

    // Assert
    verify(() => mockSignInFormBloc.add(const SignInFormEvent.emailOnChanged('test@test.com'))).called(1);
    verify(() => mockSignInFormBloc.add(const SignInFormEvent.passwordOnChanged('password'))).called(1);
    verify(() => mockSignInFormBloc.add(const SignInFormEvent.signInWithEmail())).called(1);
  });

  
}
