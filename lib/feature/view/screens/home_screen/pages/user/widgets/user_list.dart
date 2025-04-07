import 'package:flutter/material.dart';
import 'package:travelgo_admin/core/service/api_services.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ApiServices().getUserList(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No users registered');
        }
        final list = snapshot.data!;
        return ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(list[index].imageUrl),
              ),
              title: Text(list[index].name),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: list.length,
        );
      },
    );
  }
}
