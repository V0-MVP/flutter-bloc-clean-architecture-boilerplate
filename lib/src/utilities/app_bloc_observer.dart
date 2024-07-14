import 'package:bloc_clean_architecture/src/utilities/extensions/string_extension.dart';
import 'package:bloc_clean_architecture/src/utilities/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [BlocObserver] which logs all bloc state changes, errors and events.
class AppBlocObserver extends BlocObserver {
  /// [BlocObserver] which logs all bloc state changes, errors and events.
  const AppBlocObserver();

  @override
  void onTransition(
    Bloc<Object?, Object?> bloc,
    Transition<Object?, Object?> transition,
  ) {
    final buffer = StringBuffer()
      ..write('Bloc: ${bloc.runtimeType} | ')
      ..writeln('${transition.event.runtimeType}')
      ..write('Transition: ${transition.currentState.runtimeType}')
      ..writeln(' => ${transition.nextState.runtimeType}')
      ..write('New State: ${transition.nextState.toString().limit(100)}');
    logger.info(buffer.toString());
    super.onTransition(bloc, transition);
  }

  @override
  void onEvent(Bloc<Object?, Object?> bloc, Object? event) {
    final buffer = StringBuffer()
     ..writeln('On Event :')
      ..writeln('Bloc: ${bloc.runtimeType}')
      ..write('Event: ${event.toString().limit(200)}');
    logger.info(buffer.toString());
    super.onEvent(bloc, event);
  }

    @override
  void onChange(BlocBase bloc, Change change) {
    logger.info(
      'Bloc: ${bloc.runtimeType} | ${change.currentState} | ${change.nextState}',
    );
    super.onChange(bloc, change);
  }

  @override
  void onCreate(BlocBase bloc) {
    logger.info('Bloc Created | ${bloc.runtimeType} ');
    super.onCreate(bloc);
  }

  @override
  void onError(BlocBase<Object?> bloc, Object error, StackTrace stackTrace) {
    logger.error(
      'Bloc: ${bloc.runtimeType} | $error',
      error: error,
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }
}
