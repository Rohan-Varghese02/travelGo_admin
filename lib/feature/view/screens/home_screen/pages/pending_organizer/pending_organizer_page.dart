import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelgo_admin/feature/logic/admin/admin_bloc.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/category/widgets/sub_header.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/pending_organizer/widgets/pending_list.dart';
import 'package:travelgo_admin/feature/view/widgets/header.dart';

class PendingOrganizerPage extends StatelessWidget {
  const PendingOrganizerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
        child: BlocListener<AdminBloc, AdminState>(
          listener: (context, state) {
            if (state is OrganizerAccepted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Successuly added Organizer'),
                  backgroundColor: Colors.green,
                ),
              );
            }
            if (state is OrganizerRejected) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Organizer Rejected'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(header: 'Pending Organizers'),
              SizedBox(height: 50),
              Flexible(child: PendingList()),
            ],
          ),
        ),
      ),
    );
  }
}
