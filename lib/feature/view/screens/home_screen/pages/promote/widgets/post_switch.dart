import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelgo_admin/data/models/post_data_model.dart';
import 'package:travelgo_admin/feature/logic/admin/admin_bloc.dart';

class PostSwitch extends StatelessWidget {
  final PostDataModel post;

  const PostSwitch({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: post.isFeatured,
      onChanged: (value) {
        context.read<AdminBloc>().add(
          IsFeaturedSwitch(isFeatured: post.isFeatured, uid: post.postId),
        );
      },
      activeColor: Colors.green,
      inactiveThumbColor: Colors.red,
      inactiveTrackColor: Colors.red.shade200,
      activeTrackColor: Colors.green.shade200,
    );
  }
}
