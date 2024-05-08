import 'package:belajar_bloc/domain/entities/user.dart';

class UserModel {
  final String name;

  UserModel({required this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
    );
  }

  User toDomain() {
    return User(name: name);
  }
}