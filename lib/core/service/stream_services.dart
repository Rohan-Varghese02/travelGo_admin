
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelgo_admin/data/models/post_data_model.dart';

class StreamServices {
   Stream<List<PostDataModel>> getFilteredPosts(
    String searchQuery, {
    String? category,
    String? country,
  }) {
    return FirebaseFirestore.instance.collection('post').snapshots().map((
      snapshot,
    ) {
      List<PostDataModel> allPosts =
          snapshot.docs.map((doc) {
            return PostDataModel.fromMap(doc.data(), doc.id);
          }).toList();

      String lowerQuery = searchQuery.toLowerCase();

      return allPosts.where((post) {
        final matchesSearch =
            searchQuery.isEmpty
                ? true
                : post.name.toLowerCase().contains(lowerQuery);

        final matchesCategory =
            category == null || category.isEmpty
                ? true
                : post.category.toLowerCase() == category.toLowerCase();

        final matchesCountry =
            country == null || country.isEmpty
                ? true
                : post.country.toLowerCase() == country.toLowerCase();

        return matchesSearch && matchesCategory && matchesCountry;
      }).toList();
    });
  }
}