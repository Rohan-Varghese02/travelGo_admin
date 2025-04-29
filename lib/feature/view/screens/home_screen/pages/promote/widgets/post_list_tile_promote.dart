import 'package:flutter/material.dart';
import 'package:travelgo_admin/data/models/post_data_model.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/promote/widgets/post_switch.dart';
import 'package:travelgo_admin/feature/view/widgets/style_text.dart';

class PostListTilePromote extends StatelessWidget {
  final PostDataModel post;
  const PostListTilePromote({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: NetworkImage(post.imageUrl),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyleText(
                      text: post.name,
                      size: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    StyleText(
                      text: post.category,
                      size: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          ),
          PostSwitch(post: post),
        ],
      ),
    );
  }
}
