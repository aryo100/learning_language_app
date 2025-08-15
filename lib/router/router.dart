import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_language_app/const/injection/service_locator.dart';
import 'package:learning_language_app/const/utils/shared_preferences.dart';
import 'package:learning_language_app/layout/layout_scaffold_default.dart';
import 'package:learning_language_app/layout/layout_scaffold_with_navigation_bar.dart';
import 'package:learning_language_app/router/path.dart';
import 'package:learning_language_app/router/routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "root");

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Paths.login,
  redirect: (context, state) {
    final isLoggedIn = sl<SharedPref>().isUserLogin;
    print("redirect isLoggedIn : $isLoggedIn");
    if (!isLoggedIn && state.path != Paths.login) {
      return Paths.login;
    }
    if (isLoggedIn && state.path == Paths.login) {
      return Paths.home;
    }
    return null;
  },
  routes: [
    ...pages
        .where((page) => page.scaffold == ScaffoldType.custom)
        .map((page) => page.route),
    ...pages.where((page) => page.scaffold == ScaffoldType.withNav).isNotEmpty
        ? [
          StatefulShellRoute.indexedStack(
            builder:
                (context, state, navigationShell) =>
                    LayoutScaffoldWithNavigationBar(
                      navigationShell: navigationShell,
                    ),
            branches: [
              ...pages
                  .where((page) => page.scaffold == ScaffoldType.withNav)
                  .map((page) => StatefulShellBranch(routes: [page.route])),
            ],
          ),
        ]
        : [],
    ...pages.where((page) => page.scaffold == ScaffoldType.withBack).isNotEmpty
        ? [
          StatefulShellRoute.indexedStack(
            builder:
                (context, state, navigationShell) =>
                    LayoutScaffoldDefault(navigationShell: navigationShell),
            branches: [
              ...pages
                  .where((page) => page.scaffold == ScaffoldType.withBack)
                  .map((page) => StatefulShellBranch(routes: [page.route])),
            ],
          ),
        ]
        : [],
  ],
);
