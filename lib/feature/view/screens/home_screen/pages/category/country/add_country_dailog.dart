import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelgo_admin/feature/logic/admin/admin_bloc.dart';

void addCountryDailog(BuildContext context, String text) {
  final TextEditingController controller = TextEditingController();
  final key_state = GlobalKey<FormState>();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Add $text"),
        content: Form(
          key: key_state,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(hintText: "Enter $text Name"),
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
              if (key_state.currentState!.validate()) {
                context.read<AdminBloc>().add(
                  CountryAdd(country: controller.text),
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
