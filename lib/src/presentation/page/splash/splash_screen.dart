import 'package:bloc_clean_architecture/src/comman/routes.dart';
import 'package:bloc_clean_architecture/src/presentation/bloc/authenticator_watcher/authenticator_watcher_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1, microseconds: 900), () {
      Future.microtask(
        () => context.read<AuthenticatorWatcherBloc>().add(
              const AuthenticatorWatcherEvent.authCheckRequest(),
            ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticatorWatcherBloc, AuthenticatorWatcherState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () {
            Navigator.pushNamedAndRemoveUntil(
                context, SIGN_IN, (route) => false);
          },
          authenticating: (_) {},
          authenticated: (_) {
            Navigator.pushNamedAndRemoveUntil(
                context, HOME, (route) => false);
          },
          isFirstTime: (_) {
            Navigator.pushNamedAndRemoveUntil(
                context, ONBOARDING_SCREEN, (route) => false);
          },
        );
      },
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Splash Screen.',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
