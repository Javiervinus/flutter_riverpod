import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/src/features/jokes/data/models/joke_model.dart';
import 'package:riverpod_tutorial/src/features/jokes/data/repositories/jokes_repository.dart';
import 'jokes_state.dart';
export 'jokes_state.dart';

part 'jokes_state_notifier.dart';

final jokesNotifierProvider = StateNotifierProvider<JokesNotifier, JokesState>(
    (ref) =>
        JokesNotifier(jokesRepository: ref.watch(jokesRepositoryProvider)));

//* Repository
final jokesRepositoryProvider = Provider<IJokesRepository>(
  (ref) => JokesRepository(),
);
