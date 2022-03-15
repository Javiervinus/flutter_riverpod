import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_tutorial/src/features/authentication/data/models/master_model.dart';
part 'auth_state.freezed.dart';

extension AuthGetters on AuthState {
  bool get isLoading => this is _AuthStateLoading;
  bool get onError => this is _AuthStateError;
}

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _AuthStateInital;

  ///Loading
  const factory AuthState.loading() = _AuthStateLoading;

  ///Data
  const factory AuthState.data({required MasterModel master}) = _AuthStateData;

  ///Error
  const factory AuthState.error([String? error]) = _AuthStateError;
}
