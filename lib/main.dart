import 'package:bloc_clean_architecture/src/comman/themes.dart';
import 'package:bloc_clean_architecture/src/presentation/bloc/authenticator_watcher/authenticator_watcher_bloc.dart';
import 'package:bloc_clean_architecture/src/presentation/bloc/sign_in_form/sign_in_form_bloc.dart';
import 'package:bloc_clean_architecture/src/presentation/cubit/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/utilities/go_router_init.dart';
import './injection.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<AuthenticatorWatcherBloc>()),
        BlocProvider(create: (_) => di.locator<SignInFormBloc>()),
        BlocProvider(create: (_) => di.locator<ThemeCubit>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'flutter bloc clean architecture',
        theme: themeLight(context),
        darkTheme: themeDark(context),
        themeMode: ThemeMode.system,
        routerConfig: routerinit,
      ),
    );
  }
}
