import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelgo_admin/feature/logic/dashboard/dashboard_bloc.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/category/category_page.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/dashboard/dashboard_page.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/organizer/organizer_page.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/pending_organizer/pending_organizer_page.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/promote/promote_page.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/user/user_page.dart';
import 'package:travelgo_admin/feature/view/widgets/logo_text.dart';
import 'package:travelgo_admin/feature/view/widgets/sidebar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          SizedBox(
            width: width * 0.25,
            child: BlocBuilder<DashboardBloc, DashboardState>(
              builder: (context, state) {
                int selectedIndex = 0;
                if (state is DashboardPageSelected) {
                  selectedIndex = state.selectedIndex;
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LogoText(),
                      SizedBox(height: 40),
                      SidebarItem(
                        icon: Icons.dashboard,
                        label: 'Dashboard',
                        isSelected: selectedIndex == 0,
                        onTap: () {
                          context.read<DashboardBloc>().add(
                            SelectDashboardPage(index: 0),
                          );
                        },
                      ),
                      SidebarItem(
                        icon: Icons.people,
                        label: 'Organizers',
                        isSelected: selectedIndex == 1,
                        onTap: () {
                          context.read<DashboardBloc>().add(
                            SelectDashboardPage(index: 1),
                          );
                        },
                      ),
                      SidebarItem(
                        icon: Icons.people,
                        label: 'Users',
                        isSelected: selectedIndex == 2,
                        onTap: () {
                          context.read<DashboardBloc>().add(
                            SelectDashboardPage(index: 2),
                          );
                        },
                      ),
                      SidebarItem(
                        icon: Icons.people,
                        label: 'Pending Organizers',
                        isSelected: selectedIndex == 3,
                        onTap: () {
                          context.read<DashboardBloc>().add(
                            SelectDashboardPage(index: 3),
                          );
                        },
                      ),
                      SidebarItem(
                        icon: Icons.people,
                        label: 'Promote',
                        isSelected: selectedIndex == 4,
                        onTap: () {
                          context.read<DashboardBloc>().add(
                            SelectDashboardPage(index: 4),
                          );
                        },
                      ),
                      SidebarItem(
                        icon: Icons.settings,
                        label: 'Category',
                        isSelected: selectedIndex == 5,
                        onTap: () {
                          context.read<DashboardBloc>().add(
                            SelectDashboardPage(index: 5),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Main Content
          Expanded(
            child: BlocBuilder<DashboardBloc, DashboardState>(
              builder: (context, state) {
                int selectedIndex = 0;
                if (state is DashboardPageSelected) {
                  selectedIndex = state.selectedIndex;
                }

                Widget page = DashboardPage();

                switch (selectedIndex) {
                  case 1:
                    return OrganizerPage();
                  case 2:
                    return UserPage();
                  case 3:
                    return PendingOrganizerPage();
                  case 4:
                    return PromotePage();
                  case 5:
                    return CategoryPage();
                }

                return Container(
                  padding: const EdgeInsets.all(24),
                  child: page,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
