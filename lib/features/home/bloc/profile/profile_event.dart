part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.started() = _Started;
  const factory ProfileEvent.getProfile() = _GetProfile;
  const factory ProfileEvent.uploadImage(MultipartFile file) = _UploadImage;
  const factory ProfileEvent.updateProfile(ProfileEntity profile) = _UpdateProfile;
}