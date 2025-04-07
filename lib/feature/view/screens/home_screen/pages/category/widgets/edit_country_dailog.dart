import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelgo_admin/feature/logic/admin/admin_bloc.dart';

void editCategoryDailog(BuildContext context, String name, id) {
  final controller = TextEditingController(text: name);

  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: const Text('Edit Country'),
          content: TextField(controller: controller),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AdminBloc>().add(
                  CategoryUpdateEvent(name: controller.text, id: id),
                );
                Navigator.pop(context);
              },
              child: const Text('Update'),
            ),
          ],
        ),
  );
}
