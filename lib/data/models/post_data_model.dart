import 'package:cloud_firestore/cloud_firestore.dart';

class PostDataModel {
  String postId;
  final String uid; // Organizer UID
  final String name;
  final String description;
  final String venue;
  final String country;
  final String imageUrl;
  final String imagePublicId;
  final Map<String, Map<String, int>> tickets;
  final String benefits;
  final String group;
  final String registrationDeadline;
  final double latitude;
  final double longitude;
  final String category;
  final DateTime timestamp;
  final bool isFeatured; 
  PostDataModel({
    required this.postId,
    required this.timestamp,
    required this.uid,
    required this.name,
    required this.description,
    required this.venue,
    required this.country,
    required this.imageUrl,
    required this.imagePublicId,
    required this.tickets,
    required this.benefits,
    required this.group,
    required this.registrationDeadline,
    required this.latitude,
    required this.longitude,
    required this.category,
    this.isFeatured = false, 
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'description': description,
      'venue': venue,
      'country': country,
      'imageUrl': imageUrl,
      'imagePublicId': imagePublicId,
      'tickets': tickets,
      'benefits': benefits,
      'group': group,
      'registrationDeadline': registrationDeadline,
      'latitude': latitude,
      'longitude': longitude,
      'category': category,
      'timestamp': FieldValue.serverTimestamp(), // optional
      'isFeatured': isFeatured, // <-- Include when saving
      'postId': postId,
    };
  }

  factory PostDataModel.fromMap(Map<String, dynamic> map, String documentId) {
    return PostDataModel(
      postId: documentId , // Assign doc ID manually
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      venue: map['venue'] ?? '',
      country: map['country'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      imagePublicId: map['imagePublicId'] ?? '',
      tickets:
          map['tickets'] != null
              ? (map['tickets'] as Map<String, dynamic>).map((key, value) {
                return MapEntry(
                  key,
                  Map<String, int>.from(
                    (value as Map).map(
                      (k, v) => MapEntry(
                        k.toString(),
                        int.tryParse(v.toString()) ?? 0,
                      ),
                    ),
                  ),
                );
              })
              : {}, // Handle null tickets field gracefully
      benefits: map['benefits'] ?? '',
      group: map['group'] ?? '',
      registrationDeadline: map['registrationDeadline'] ?? '',
      latitude:
          map['latitude'] != null ? (map['latitude'] as num).toDouble() : 0.0,
      longitude:
          map['longitude'] != null ? (map['longitude'] as num).toDouble() : 0.0,
      category: map['category'] ?? '',
      isFeatured: map['isFeatured'] ?? false, // Fallback to false
      timestamp:
          map['timestamp'] != null
              ? (map['timestamp'] as Timestamp).toDate()
              : DateTime.now(),
    );
  }
   factory PostDataModel.fromFirestore(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;
    return PostDataModel.fromMap(map, doc.id);
  }
}
