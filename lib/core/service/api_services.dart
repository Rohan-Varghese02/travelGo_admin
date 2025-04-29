import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelgo_admin/data/models/category_model.dart';
import 'package:travelgo_admin/data/models/pending_organizer_model.dart';
import 'package:travelgo_admin/data/models/user_model.dart';

class ApiServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addCountryCategory(String country) async {
    await firestore.collection('categories').add({
      'name': country,
      'type': 'country',
      'timeStamp': Timestamp.now(),
    });
    log('successful added Category');
  }

  void editCountryCategory(String name, id) async {
    firestore.collection('categories').doc(id).update({'name': name});
  }

  void deleteCountryCategory(String id) async {
    firestore.collection('categories').doc(id).delete();
  }

  void isFeatureCategory(bool isFeature, String uid) {
    firestore
        .collection('post')
        .doc(uid)
        .update({'isFeatured': isFeature})
        .then((_) {
          print('isFeature updated sucessfully');
        })
        .catchError((error) {
          print('Failed to update isFeature:$error');
        });
  }

  Stream<List<Category>> countryCategoryStream() {
    return firestore
        .collection('categories')
        .where('type', isEqualTo: 'country')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Category.fromFirestore(doc)).toList(),
        );
  }

  void addEventCategory(String event) async {
    firestore.collection('categories').add({
      'name': event,
      'type': 'event',
      'timeStamp': Timestamp.now(),
    });
  }

  Stream<List<Category>> eventCategoryStream() {
    return firestore
        .collection('categories')
        .where('type', isEqualTo: 'event')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Category.fromFirestore(doc)).toList(),
        );
  }

  // Pending user

  Stream<List<OrganizerModel>> getPendingOrgazinerStream() {
    return firestore
        .collection('Organizers')
        .where('role', isEqualTo: 'pending-organizer')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map((doc) => OrganizerModel.fromFireStore(doc))
                  .toList(),
        );
  }

  void testPendingFetch() async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('Users')
            .where('role', isEqualTo: 'user')
            .get();

    print("Found ${snapshot.docs.length} pending organizers");
  }

  void acceptOrganizer(String id) {
    firestore.collection('Organizers').doc(id).update({'role': 'organizer'});
  }

  void rejectOrganizer(String id) {
    firestore.collection('Organizers').doc(id).update({
      'role': 'not-organizer',
    });
  }

  // User list

  Stream<List<UserModel>> getUserList() {
    return firestore
        .collection('Users')
        .where('role', isEqualTo: 'user')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => UserModel.fromFirestore(doc)).toList(),
        );
  }

  // Organizer List
  Stream<List<OrganizerModel>> getOrganizerList() {
    return firestore
        .collection('Organizers')
        .where('role', isEqualTo: 'organizer')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map((doc) => OrganizerModel.fromFireStore(doc))
                  .toList(),
        );
  }
}
