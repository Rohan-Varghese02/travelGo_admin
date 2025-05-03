import 'package:flutter/material.dart';
import 'package:travelgo_admin/core/service/stream_services.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/dashboard/widgets/request_tile.dart';
import 'package:travelgo_admin/feature/view/widgets/style_text.dart';

class RequestStream extends StatelessWidget {
  const RequestStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: StreamServices().getRequest(),
      builder: (context, snapshot) {
        if (!snapshot.hasData ||
            snapshot.data == null ||
            snapshot.data!.isEmpty) {
          return Center(child: StyleText(text: 'No request pending',));
        }
        final requests = snapshot.data;
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: requests!.length,
          itemBuilder: (context, index) {
            final request = requests[index];
            return RequestTile(request: request);
          },
          separatorBuilder: (context, index) => SizedBox(width: 20),
          );
        },
    );
  }
}
