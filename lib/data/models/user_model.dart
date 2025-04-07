import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String imageUrl;
  final String name;
  final String password;
  final String phoneNumber;
  final String role;
  final String uid;

  UserModel({
    required this.email,
    required this.imageUrl,
    required this.name,
    required this.password,
    required this.phoneNumber,
    required this.role,
    required this.uid,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      email: data['email'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      name: data['name'] ?? '',
      password: data['password'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      role: data['role'] ?? '',
      uid: data['uid'] ?? '',
    );
  }
}
