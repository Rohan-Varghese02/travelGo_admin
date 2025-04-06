import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelgo_admin/feature/logic/admin/admin_bloc.dart';

void deleteCategoryDailog(BuildContext context, String name, id) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Do you really want to delete $name'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              context.read<AdminBloc>().add(CountryDeleting(id: id));
              Navigator.of(context).pop();
            },
            child: const Text("Delete"),
          ),
        ],
      );
    },
  );
}
