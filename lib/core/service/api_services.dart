import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelgo_admin/data/models/category_model.dart';

class ApiServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addCountryCategory(String country) async {
    await firestore.collection('categories').add({
      'name': country,
      'type': 'country',
    });
    log('successful added Category');
  }

  void editCountryCategory(String name, id) async {
    firestore.collection('categories').doc(id).update({'name': name});
  }

  void deleteCountryCategory(String id) async {
    firestore.collection('categories').doc(id).delete();
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
    firestore.collection('categories').add({'name': event, 'type': 'event'});
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
}
