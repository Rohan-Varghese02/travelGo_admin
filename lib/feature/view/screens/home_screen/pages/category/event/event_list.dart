import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelgo_admin/core/service/api_services.dart';
import 'package:travelgo_admin/feature/logic/admin/admin_bloc.dart';

class EventList extends StatelessWidget {
  const EventList({super.key});
  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = ApiServices();
    return StreamBuilder(
      stream: apiServices.eventCategoryStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                'No Category added',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
        final categories = snapshot.data!;
        return ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                categories[index].name,
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                ),
              ),
              trailing: PopupMenuButton<String>(
                itemBuilder:
                    (context) => [
                      const PopupMenuItem(value: 'Edit', child: Text('Edit')),
                      const PopupMenuItem(
                        value: 'Delete',
                        child: Text('Delete'),
                      ),
                    ],
                onSelected: (value) {
                  if (value == 'Edit') {
                    context.read<AdminBloc>().add(
                      CategoryEditEvent(
                        name: categories[index].name,
                        id: categories[index].id,
                      ),
                    );
                  } else {
                    context.read<AdminBloc>().add(
                      CategoryDeleteBtn(
                        id: categories[index].id,
                        name: categories[index].name,
                      ),
                    );
                  }
                },
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(),
        );
      },
    );
  }
}
