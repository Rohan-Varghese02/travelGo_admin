import 'package:cloud_firestore/cloud_firestore.dart';

class PendingOrganizerModel {
  final String id;
  final String name;
  final String uid;
  final String email;
  final String password;
  final String role;
  final String phoneNumber;
  final String imageUrl;
  final String company;
  final String designation;
  final String about;
  final String experience;
  final int followersCount;

  PendingOrganizerModel({
    required this.id,
    required this.name,
    required this.uid,
    required this.email,
    required this.password,
    required this.role,
    required this.phoneNumber,
    required this.imageUrl,
    required this.company,
    required this.designation,
    required this.about,
    required this.experience,
    required this.followersCount,
  });

  factory PendingOrganizerModel.fromFireStore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return PendingOrganizerModel(
      id: doc.id,
      name: data['name'] ?? '',
      uid: data['uid'] ?? '',
      email: data['email'] ?? '',
      password: data['password'] ?? '',
      role: data['role'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      company: data['company'] ?? '',
      designation: data['designation'] ?? '',
      about: data['about'] ?? '',
      experience: data['experience'] ?? '',
      followersCount: data['followersCount'] ?? 0,
    );
  }
}
