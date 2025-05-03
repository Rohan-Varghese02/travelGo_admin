import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelgo_admin/core/constants/colors.dart';
import 'package:travelgo_admin/data/models/request_data.dart';
import 'package:travelgo_admin/feature/logic/admin/admin_bloc.dart';
import 'package:travelgo_admin/feature/view/widgets/square_elevated_btn.dart';
import 'package:travelgo_admin/feature/view/widgets/text_fw.dart';

class RequestTile extends StatelessWidget {
  final RequestData request;
  const RequestTile({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 400,
      decoration: BoxDecoration(border: Border.all()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFw(
                firstword: 'Subject: ',
                secondWord: request.subject,
                fontSize: 18,
              ),
              TextFw(
                firstword: 'Content: ',
                secondWord: request.content,
                fontSize: 18,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SquareElevatedBtn(
                text: 'Approve',
                radius: 10,
                onPressed: () {
                  context.read<AdminBloc>().add(
                    RequestAccept(request: request),
                  );
                },
                backgroundColor: green,
                color: white,
              ),
              SquareElevatedBtn(
                text: 'Decline',
                radius: 10,
                onPressed: () {
                  context.read<AdminBloc>().add(
                    RequestReject(request: request),
                  );
                },
                backgroundColor: errorred,
                color: white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
