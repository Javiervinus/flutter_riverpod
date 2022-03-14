import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_tutorial/src/features/jokes/data/models/joke_model.dart';

part 'jokes_state.freezed.dart';

///Extension Method for easy comparison
extension JokesGetters on JokesState {
  bool get isLoading => this is _JokesStateLoading;
}

@freezed
abstract class JokesState with _$JokesState {
  const factory JokesState.initial() = _JokesStateInital;

  ///Loading
  const factory JokesState.loading() = _JokesStateLoading;

  ///Data
  const factory JokesState.data({required JokeModel joke}) = _JokesStateData;

  ///Error
  const factory JokesState.error([String? error]) = _JokesStateError;
}
