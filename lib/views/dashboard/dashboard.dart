import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stful_shell_go_router/views/dashboard/widgets/bottom_navigator.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationWidget(currentIndex: navigationShell!.currentIndex, onTap: _switchBranch),
      body: navigationShell,
    );
  }

  _switchBranch(int index) {
    navigationShell.goBranch(index);
    initialLocation:
    index == navigationShell.currentIndex;
  }
}
