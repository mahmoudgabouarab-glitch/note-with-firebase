import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends Equatable {
  final String uid;
  final String name;
  final String phone;
  final String address;
  final String email;
  final DateTime createdAt;

  const UserModel({
    required this.uid,
    required this.name,
    required this.phone,
    required this.address,
    required this.email,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      email: json['email'] ?? '',
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }

  @override
  List<Object?> get props => [uid, name, phone, address, email, createdAt];
}
