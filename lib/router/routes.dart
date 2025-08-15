import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_language_app/features/flashcard/presentation/flashcard_screen.dart';
import 'package:learning_language_app/features/home/presentation/home_screen.dart';
import 'package:learning_language_app/features/login/presentation/login_screen.dart';
import 'package:learning_language_app/features/puzzle/presentation/puzzle_screen.dart';
import 'package:learning_language_app/features/quiz/presentation/quiz_screen.dart';
import 'package:learning_language_app/features/search/presentation/search_screen.dart';
import 'package:learning_language_app/features/word_store/presntation/word_store_screen.dart';
import 'package:learning_language_app/router/path.dart';

enum ScaffoldType { custom, withNav, withBack }

class Page {
  final GoRoute route;
  final ScaffoldType scaffold;
  Page({required this.route, this.scaffold = ScaffoldType.custom});
}

List<Page> pages = [
  Page(
    route: GoRoute(
      path: Paths.home,
      builder: (context, state) => const HomeScreen(),
    ),
  ),
  Page(
    route: GoRoute(
      path: Paths.login,
      builder: (context, state) => const LoginScreen(),
    ),
  ),
  Page(
    route: GoRoute(
      path: Paths.wordStore,
      builder: (context, state) => const WordStoreScreen(),
    ),
  ),
  Page(
    route: GoRoute(
      path: Paths.searchPage,
      builder: (context, state) => const SearchScreen(),
    ),
  ),
  Page(
    route: GoRoute(
      path: Paths.quiz,
      builder: (context, state) => const QuizScreen(),
    ),
  ),
  Page(
    route: GoRoute(
      path: Paths.puzzle,
      builder: (context, state) => const PuzzleScreen(),
    ),
  ),
  Page(
    route: GoRoute(
      path: Paths.flashcard,
      builder: (context, state) => const FlashcardScreen(),
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
  Menu(label: "Home", icon: Icons.home),
  Menu(label: "Attendance", icon: Icons.event_available),
  Menu(label: "Check Out", icon: Icons.logout, isPrimary: true),
  Menu(label: "Form", icon: Icons.description),
  Menu(label: "Setting", icon: Icons.settings),
];
