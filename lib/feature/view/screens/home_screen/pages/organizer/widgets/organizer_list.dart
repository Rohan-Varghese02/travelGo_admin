import 'package:flutter/material.dart';
import 'package:travelgo_admin/core/service/api_services.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/organizer/widgets/organizer_text.dart';

class OrganizerList extends StatelessWidget {
  const OrganizerList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ApiServices().getOrganizerList(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No organizers registered'));
        }
        final docs = snapshot.data!;
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: docs.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.deepPurple.shade100),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(docs[index].imageUrl),
                    ),
                    SizedBox(height: 20),
                    OrganizerText(text: docs[index].name, size: 26),
                    SizedBox(height: 20),
                    OrganizerText(text: docs[index].company, size: 20),
                    SizedBox(height: 40),
                    OrganizerText(
                      text:
                          'Followers:${docs[index].followersCount.toString()}',
                      size: 20,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
