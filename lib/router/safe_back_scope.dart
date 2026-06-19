import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_language_app/router/path.dart';

/// Intercepts the system back button when [GoRouter] cannot safely pop.
class SafeBackScope extends StatelessWidget {
  const SafeBackScope({
    super.key,
    required this.fallback,
    required this.child,
    this.exitOnFallback = false,
  });

  final String fallback;
  final Widget child;
  final bool exitOnFallback;

  @override
  Widget build(BuildContext context) {
    final canPop = canSafelyPop(context);

    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop || !context.mounted) return;
        if (exitOnFallback) {
          SystemNavigator.pop();
          return;
        }
        context.go(fallback);
      },
      child: child,
    );
  }
}

/// True only when popping would leave at least one route on the stack.
bool canSafelyPop(BuildContext context) {
  final router = GoRouter.of(context);
  if (!router.canPop()) return false;
  final matches = router.routerDelegate.currentConfiguration.matches;
  return matches.length > 1;
}

String fallbackForRoute(String path) {
  switch (path) {
    case Paths.wordStore:
    case Paths.searchPage:
    case Paths.quiz:
    case Paths.puzzle:
    case Paths.flashcard:
    case Paths.quizResult:
    case Paths.puzzleResult:
    case Paths.flashcardSummary:
      return Paths.wordStore;
    case Paths.wordBag:
    case Paths.favorites:
    case Paths.setting:
    case Paths.pointsHistory:
    case Paths.wordDetail:
      return Paths.home;
    case Paths.login:
    case Paths.home:
      return Paths.home;
    default:
      return Paths.home;
  }
}

bool shouldExitOnBack(String path) =>
    path == Paths.home || path == Paths.login;
