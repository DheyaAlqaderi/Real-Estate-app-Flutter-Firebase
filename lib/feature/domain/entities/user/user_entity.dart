import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? name;
  final String? email;
  final String? uid;
  final String? status;
  final String? password;
  final String? avatar;

  const UserEntity({
    this.avatar,
    this.name,
    this.email,
    this.uid,
    this.status = "Hello there i'm using this app",
    this.password,
  });

  @override
  List<Object?> get props => [
    name,
    email,
    uid,
    avatar,
    status,
    password,
  ];
}