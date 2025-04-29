import 'package:flutter/material.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/category/event/event_list.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/category/widgets/sub_header.dart';

class EventCategory extends StatelessWidget {
  const EventCategory({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Flexible(
      child: Container(
        width: width * 0.325,
        decoration: BoxDecoration(border: Border.all()),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SubHeader(header: 'Events', onPressed: onPressed),
              EventList(),
            ],
          ),
        ),
      ),
    );
  }
}
