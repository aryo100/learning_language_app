import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/router/routes.dart';

class LayoutScaffoldWithNavigationBar extends StatelessWidget {
  const LayoutScaffoldWithNavigationBar(
      {required this.navigationShell, Key? key})
      : super(key: key ?? const ValueKey<String>("LayoutScaffold"));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
                color: ColorPallete.primary,
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: const Icon(Icons.logout, size: 32, color: Colors.white),
          ),
          const Text(
            "Check Out",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: ColorPallete.primary),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ]),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: navigationShell.currentIndex,
          onTap: (value) => {if (value != 2) navigationShell.goBranch(value)},
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: menus
              .map(
                (menu) => BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: menu.isPrimary
                        ? const Visibility(visible: true, child: SizedBox())
                        : Column(
                            children: [
                              Icon(menu.icon,
                                  size: 32,
                                  color: navigationShell.currentIndex ==
                                          menus.indexOf(menu)
                                      ? ColorPallete.primary
                                      : Colors.grey),
                              Text(
                                menu.label,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: navigationShell.currentIndex ==
                                            menus.indexOf(menu)
                                        ? ColorPallete.primary
                                        : Colors.grey),
                              ),
                            ],
                          ),
                  ),
                  label: "",
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}