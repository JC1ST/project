import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/controllers/mainscreen_provider.dart';
import 'package:shopping_app/views/shared/bottom_nav.dart';
import 'package:shopping_app/views/ui/cartpage.dart';
import 'package:shopping_app/views/ui/favorites.dart';
import 'package:shopping_app/views/ui/homepage.dart';
import 'package:shopping_app/views/ui/profilepage.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> pageList = [
    HomePage(),
    Favorites(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return Scaffold(
          backgroundColor: Color(0xFFE2E2E2),
          body: pageList[mainScreenNotifier.pageIndex],
          bottomNavigationBar: BottomNavBar(),
        );
      },
    );
  }
}
