import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_language_app/const/injection/service_locator.dart';
import 'package:learning_language_app/const/utils/shared_preferences.dart';
import 'package:learning_language_app/layout/layout_scaffold_default.dart';
import 'package:learning_language_app/layout/layout_scaffold_with_navigation_bar.dart';
import 'package:learning_language_app/router/path.dart';
import 'package:learning_language_app/router/routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

late final GoRouter router;

/// Call after [initLocator] so [SharedPref] is ready for the initial route.
GoRouter createRouter() {
  final isLoggedIn = sl<SharedPref>().isUserLogin;

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: isLoggedIn ? Paths.home : Paths.login,
    redirect: (context, state) {
      final loggedIn = sl<SharedPref>().isUserLogin;
      final onLogin = state.matchedLocation == Paths.login;

      if (!loggedIn && !onLogin) {
        return Paths.login;
      }
      if (loggedIn && onLogin) {
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
      ...pages
              .where((page) => page.scaffold == ScaffoldType.withBack)
              .isNotEmpty
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
}
