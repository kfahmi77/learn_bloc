import 'package:belajar_bloc/domain/entities/user.dart';

class UserModel {
  final String name;
  final String email;

  UserModel({required this.name, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
    );
  }

  User toDomain() {
    return User(name: name, email: email);
  }
}