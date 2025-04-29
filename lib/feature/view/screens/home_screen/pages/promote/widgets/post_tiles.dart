import 'package:flutter/material.dart';
import 'package:travelgo_admin/core/constants/colors.dart';
import 'package:travelgo_admin/core/service/stream_services.dart';
import 'package:travelgo_admin/data/models/post_data_model.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/promote/widgets/post_list_tile_promote.dart';
import 'package:travelgo_admin/feature/view/widgets/style_text.dart';

class PostTiles extends StatefulWidget {
  const PostTiles({super.key});

  @override
  State<PostTiles> createState() => _PostTilesState();
}

class _PostTilesState extends State<PostTiles> {
  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(border: Border.all(color: themeColor)),
      width: 600,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StyleText(
                    text: 'All Post',
                    size: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: searchController,
                      onChanged: (query) {
                        setState(() {
                          searchQuery = query;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search by post name',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.8,
              child: StreamBuilder<List<PostDataModel>>(
                stream: StreamServices().getFilteredPosts(searchQuery),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No posts found'));
                  } else {
                    final posts = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        return GestureDetector(
                          onTap: () {},
                          child: PostListTilePromote(post: post),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
