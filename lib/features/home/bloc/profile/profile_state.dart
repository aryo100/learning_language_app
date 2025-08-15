part of 'profile_bloc.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    ProfileEntity? profile,
    String? uploadImagePath,
    String? errorMessage,
    @Default(false) bool isLoading,
  }) = _ProfileState;
}
