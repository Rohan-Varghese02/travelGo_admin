import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelgo_admin/data/models/category_model.dart';

class ApiServices {
  void addCountryCategory(String country) async {
    await FirebaseFirestore.instance.collection('categories').add({
      'name': country,
      'type': 'country',
    });
    log('successful added Category');
  }

  void editCountryCategory(String name, id) async {
    FirebaseFirestore.instance.collection('categories').doc(id).update({
      'name': name,
    });
  }

  void deleteCountryCategory(String id) async {
    FirebaseFirestore.instance.collection('categories').doc(id).delete();
  }

  Stream<List<Category>> countryCategoryStream() {
    return FirebaseFirestore.instance
        .collection('categories')
        .where('type', isEqualTo: 'country')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Category.fromFirestore(doc)).toList(),
        );
  }
}
