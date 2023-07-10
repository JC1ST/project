import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/controllers/mainscreen_provider.dart';
import 'package:shopping_app/views/shared/bottom_nav_widget.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 15, bottom: 12),
            child: Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavWidget(
                    onTap: () {
                      mainScreenNotifier.pageIndex = 0;
                    },
                    icon: mainScreenNotifier.pageIndex == 0
                        ? Icons.home
                        : Icons.home_outlined,
                  ),
                  BottomNavWidget(
                    onTap: () {
                      mainScreenNotifier.pageIndex = 1;
                    },
                    icon: mainScreenNotifier.pageIndex == 1
                        ? Ionicons.heart
                        : Ionicons.heart_circle_outline,
                  ),
                  BottomNavWidget(
                    onTap: () {
                      mainScreenNotifier.pageIndex = 2;
                    },
                    icon: mainScreenNotifier.pageIndex == 2
                        ? Icons.shopping_cart
                        : Icons.shopping_cart_outlined,
                  ),
                  BottomNavWidget(
                    onTap: () {
                      mainScreenNotifier.pageIndex = 3;
                    },
                    icon: mainScreenNotifier.pageIndex == 3
                        ? Icons.person
                        : Icons.person_outline,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
