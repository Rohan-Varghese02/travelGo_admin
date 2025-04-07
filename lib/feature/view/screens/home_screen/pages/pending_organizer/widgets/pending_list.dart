import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelgo_admin/core/service/api_services.dart';
import 'package:travelgo_admin/feature/logic/admin/admin_bloc.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/pending_organizer/widgets/pending_button.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/pending_organizer/widgets/text_form.dart';

class PendingList extends StatelessWidget {
  const PendingList({super.key});

  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = ApiServices();
    return StreamBuilder(
      stream: apiServices.getPendingOrgazinerStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              'No pending organizer request',
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
        }
        final categories = snapshot.data!;
        return SizedBox(
          height: 640,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 540,
                  height: 340,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 100,
                            backgroundImage: NetworkImage(
                              categories[index].imageUrl,
                            ),
                          ),
                        ),
                        TextForm(text: 'Name:${categories[index].name}'),
                        TextForm(text: 'Company:${categories[index].company}'),
                        TextForm(
                          text: 'Designation:${categories[index].designation}',
                        ),
                        TextForm(text: 'Email:${categories[index].email}'),
                        TextForm(
                          text: 'Phone Number:${categories[index].phoneNumber}',
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PendingButton(
                                text: 'Reject',
                                onPressed: () {
                                  context.read<AdminBloc>().add(
                                    RejectOrganizer(id: categories[index].id),
                                  );
                                },
                                color: Colors.red,
                              ),
                              PendingButton(
                                text: 'Accept',
                                color: Colors.green,
                                onPressed: () {
                                  context.read<AdminBloc>().add(
                                    AcceptOrganizer(id: categories[index].id),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
