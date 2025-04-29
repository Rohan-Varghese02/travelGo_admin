import 'package:flutter/material.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/category/country/country_list.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/category/widgets/sub_header.dart';

class CountryCategory extends StatelessWidget {
  const CountryCategory({super.key, this.onPressed});
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
              SubHeader(header: 'Country', onPressed: onPressed),
              CountryList(),
            ],
          ),
        ),
      ),
    );
  }
}
