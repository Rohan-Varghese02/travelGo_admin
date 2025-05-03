import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelgo_admin/core/constants/colors.dart';
import 'package:travelgo_admin/feature/logic/admin/admin_bloc.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/dashboard/widgets/request_stream.dart';
import 'package:travelgo_admin/feature/view/widgets/style_text.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocListener<AdminBloc, AdminState>(
      listenWhen: (previous, current) => current is RequestStatus,
      listener: (context, state) {
        if (state is RequestStatus) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: StyleText(text: state.message, color: white)),
          );
        }
      },
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10),
          width: width,
          height: height * 0.3,
          decoration: BoxDecoration(border: Border.all()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StyleText(
                text: 'Request By Organizer',
                decoration: TextDecoration.underline,
                size: 24,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10),
              SizedBox(height: height * 0.2, child: RequestStream()),
            ],
          ),
        ),
      ),
    );
  }
}
