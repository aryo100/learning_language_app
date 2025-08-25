import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/profile_entity.dart';
import '../../domain/usecases/get_profile_usecase.dart';
import '../../domain/usecases/update_profile_usecase.dart';
import '../../domain/usecases/upload_image_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUsecase getProfileUsecase;
  final UploadImageUsecase uploadImageUsecase;
  final UpdateProfileUsecase updateProfileUsecase;

  ProfileBloc(
    this.getProfileUsecase,
    this.uploadImageUsecase,
    this.updateProfileUsecase,
  ) : super(ProfileState()) {
    on<_GetProfile>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        final result = await getProfileUsecase.call();
        result.fold(
          (profile) => emit(state.copyWith(profile: profile)),
          (error) => emit(
            state.copyWith(errorMessage: 'Failed to get profile: $error'),
          ),
        );
      } catch (e) {
        emit(state.copyWith(errorMessage: 'Failed to get profile: $e'));
      }
      emit(state.copyWith(isLoading: false));
    });

    on<_UploadImage>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        final result = await uploadImageUsecase.call(event.file);
        result.fold(
          (path) => emit(state.copyWith(uploadImagePath: path)),
          (error) => emit(
            state.copyWith(errorMessage: 'Failed to upload image: $error'),
          ),
        );
      } catch (e) {
        emit(state.copyWith(errorMessage: 'Failed to upload image: $e'));
      }
      emit(state.copyWith(isLoading: false));
    });

    on<_UpdateProfile>((event, emit) async {
      emit(state.copyWith(isLoading: true, profile: null));
      try {
        final result = await updateProfileUsecase.call(event.profile);
        result.fold(
          (profile) {
            emit(state.copyWith(profile: profile));
          },
          (error) => emit(
            state.copyWith(errorMessage: 'Failed to update profile: $error'),
          ),
        );
      } catch (e) {
        emit(state.copyWith(errorMessage: 'Failed to update profile: $e'));
      }
      emit(state.copyWith(isLoading: false));
    });
  }
}
