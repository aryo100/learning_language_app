import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_language_app/features/favorites/presentation/favorites_screen.dart';
import 'package:learning_language_app/features/flashcard/presentation/flashcard_screen.dart';
import 'package:learning_language_app/features/flashcard/presentation/flashcard_summary_screen.dart';
import 'package:learning_language_app/features/home/presentation/home_screen.dart';
import 'package:learning_language_app/features/login/presentation/login_screen.dart';
import 'package:learning_language_app/features/points/presentation/points_history_screen.dart';
import 'package:learning_language_app/features/puzzle/presentation/puzzle_result_screen.dart';
import 'package:learning_language_app/features/puzzle/presentation/puzzle_screen.dart';
import 'package:learning_language_app/features/quiz/presentation/quiz_result_screen.dart';
import 'package:learning_language_app/features/quiz/presentation/quiz_screen.dart';
import 'package:learning_language_app/features/search/presentation/search_screen.dart';
import 'package:learning_language_app/features/search/presentation/word_detail_screen.dart';
import 'package:learning_language_app/features/settings/presentation/settings_screen.dart';
import 'package:learning_language_app/features/word_store/presentation/word_bag_screen.dart';
import 'package:learning_language_app/features/word_store/presntation/word_store_screen.dart';
import 'package:learning_language_app/router/path.dart';
import 'package:learning_language_app/router/route_models.dart';
import 'package:learning_language_app/router/safe_back_scope.dart';

enum ScaffoldType { custom, withNav, withBack }

class Page {
  final GoRoute route;
  final ScaffoldType scaffold;
  Page({required this.route, this.scaffold = ScaffoldType.custom});
}

Widget _routeScreen(String path, Widget child) {
  return SafeBackScope(
    fallback: fallbackForRoute(path),
    exitOnFallback: shouldExitOnBack(path),
    child: child,
  );
}

List<Page> pages = [
  Page(
    route: GoRoute(
      path: Paths.home,
      builder: (context, state) => _routeScreen(Paths.home, const HomeScreen()),
    ),
  ),
  Page(
    route: GoRoute(
      path: Paths.login,
      builder: (context, state) => _routeScreen(Paths.login, const LoginScreen()),
    ),
  ),
  Page(
    route: GoRoute(
      path: Paths.wordStore,
      builder: (context, state) =>
          _routeScreen(Paths.wordStore, const WordStoreScreen()),
    ),
  ),
  Page(
    route: GoRoute(
      path: Paths.searchPage,
      builder: (context, state) =>
          _routeScreen(Paths.searchPage, const SearchScreen()),
    ),
  ),
  Page(
    route: GoRoute(
      path: Paths.quiz,
      builder: (context, state) => _routeScreen(Paths.quiz, const QuizScreen()),
    ),
  ),
  Page(
    route: GoRoute(
      path: Paths.puzzle,
      builder: (context, state) =>
          _routeScreen(Paths.puzzle, const PuzzleScreen()),
    ),
  ),
  Page(
    route: GoRoute(
      path: Paths.flashcard,
      builder: (context, state) =>
          _routeScreen(Paths.flashcard, const FlashcardScreen()),
    ),
  ),
  Page(
    route: GoRoute(
      path: Paths.wordDetail,
      builder: (context, state) {
        final word = state.pathParameters['word'] ?? '';
        return _routeScreen(
          Paths.wordDetail,
          WordDetailScreen(word: Uri.decodeComponent(word)),
        );
      },
    ),
  ),
  Page(
    route: GoRoute(
      path: Paths.wordBag,
      builder: (context, state) =>
          _routeScreen(Paths.wordBag, const WordBagScreen()),
    ),
  ),
  Page(
    route: GoRoute(
      path: Paths.favorites,
      builder: (context, state) =>
          _routeScreen(Paths.favorites, const FavoritesScreen()),
    ),
  ),
  Page(
    route: GoRoute(
      path: Paths.quizResult,
      builder: (context, state) {
        final args = state.extra as QuizResultArgs;
        return _routeScreen(Paths.quizResult, QuizResultScreen(args: args));
      },
    ),
  ),
  Page(
    route: GoRoute(
      path: Paths.puzzleResult,
      builder: (context, state) {
        final args = state.extra as PuzzleResultArgs;
        return _routeScreen(Paths.puzzleResult, PuzzleResultScreen(args: args));
      },
    ),
  ),
  Page(
    route: GoRoute(
      path: Paths.flashcardSummary,
      builder: (context, state) {
        final args = state.extra as FlashcardSummaryArgs;
        return _routeScreen(
          Paths.flashcardSummary,
          FlashcardSummaryScreen(args: args),
        );
      },
    ),
  ),
  Page(
    route: GoRoute(
      path: Paths.setting,
      builder: (context, state) =>
          _routeScreen(Paths.setting, const SettingsScreen()),
    ),
  ),
  Page(
    route: GoRoute(
      path: Paths.pointsHistory,
      builder: (context, state) => _routeScreen(
        Paths.pointsHistory,
        const PointsHistoryScreen(),
      ),
    ),
  ),
];

class Menu {
  const Menu({required this.label, required this.icon, this.isPrimary = false});

  final String label;
  final IconData icon;
  final bool isPrimary;
}

const menus = [
  Menu(label: 'Home', icon: Icons.home),
  Menu(label: 'Attendance', icon: Icons.event_available),
  Menu(label: 'Check Out', icon: Icons.logout, isPrimary: true),
  Menu(label: 'Form', icon: Icons.description),
  Menu(label: 'Setting', icon: Icons.settings),
];
