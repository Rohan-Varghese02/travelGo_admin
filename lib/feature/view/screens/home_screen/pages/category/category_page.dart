import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelgo_admin/feature/logic/admin/admin_bloc.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/category/widgets/add_category_dailog.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/category/widgets/category_header.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/category/country/country_category.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/category/widgets/delete_category_dailog.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/category/widgets/edit_category_dailog.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40),
        child: BlocListener<AdminBloc, AdminState>(
          listener: (context, state) {
            log(state.runtimeType.toString());
            if (state is CountryAddMenuOpen) {
              addcategoryDailog(context);
            } else if (state is EditCountryState) {
              editCategoryDailog(context, state.name, state.id);
            } else if (state is CountryAdded) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Country added successfully'),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is CountryUpdated) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Country Successfully Updated'),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is DeleteIntitateCountryState) {
              deleteCategoryDailog(context, state.name, state.id);
            } else if (state is CountryDeletedSuccessful) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Category Deleted Successfully'),
                  backgroundColor: Colors.green,
                ),
              );
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryHeader(),
              SizedBox(height: 40),
              Row(
                children: [
                  CountryCategory(
                    onPressed: () {
                      context.read<AdminBloc>().add(CountryAddButton());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
