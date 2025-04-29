import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelgo_admin/feature/logic/admin/admin_bloc.dart';

void addEventDailog(BuildContext context) {
  TextEditingController controller = TextEditingController();
  final keystate = GlobalKey<FormState>();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Add Event'),
        content: Form(
          key: keystate,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(hintText: "Enter event name"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter the field';
              }
              return null;
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              if (keystate.currentState!.validate()) {
                context.read<AdminBloc>().add(
                  EventAddEvent(event: controller.text),
                );
                Navigator.of(context).pop();
              }
            },
            child: const Text("Add"),
          ),
        ],
      );
    },
  );
}
