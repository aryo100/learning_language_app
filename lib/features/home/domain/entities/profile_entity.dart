import 'package:equatable/equatable.dart';
import 'package:learning_language_app/features/home/data/models/profile/profile_model.dart';

class ProfileEntity extends Equatable {
  final String email;
  final String name;
  final String photoUrl;
  final num point;

  const ProfileEntity({
    required this.email,
    required this.name,
    required this.photoUrl,
    required this.point,
  });

  @override
  List<Object?> get props => [email, name, photoUrl, point];

  copyWith({String? email, String? name, String? photoUrl, num? point}) {
    return ProfileEntity(
      email: email ?? this.email,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      point: point ?? this.point,
    );
  }

  static ProfileEntity fromModel(ProfileModel model) {
    return ProfileEntity(
      email: model.email,
      name: model.name,
      photoUrl: model.photoUrl,
      point: model.point,
    );
  }

  Map<String, dynamic> toMap() {
    return {'email': email, 'name': name, 'photoUrl': photoUrl, 'point': point};
  }
}
