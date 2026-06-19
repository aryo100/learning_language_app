import 'package:flutter/material.dart';
import 'package:learning_language_app/widgets/flashcard_style_page_header.dart';

/// Shared page shell: grey background, [SafeArea], flashcard-style top bar.
class FlashcardStyleScaffold extends StatelessWidget {
  const FlashcardStyleScaffold({
    super.key,
    required this.header,
    required this.child,
    this.headerBottomSpacing = 8,
  });

  FlashcardStyleScaffold.page({
    super.key,
    required String title,
    required VoidCallback onBack,
    Widget? trailing,
    required this.child,
    this.headerBottomSpacing = 8,
  }) : header = FlashcardStylePageHeader(
         title: title,
         onBack: onBack,
         trailing: trailing,
       );

  final Widget header;
  final Widget child;
  final double headerBottomSpacing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            header,
            SizedBox(height: headerBottomSpacing),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

BoxDecoration flashcardStylePanelDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.08),
        blurRadius: 8,
        offset: const Offset(0, 4),
      ),
    ],
  );
}
