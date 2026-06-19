import 'package:flutter/material.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/typography.dart';
import 'package:learning_language_app/features/word_store/domain/entities/word_entity.dart';

import 'package:learning_language_app/widgets/flashcard_style_scaffold.dart';

class FlashcardStyleEmptyPanel extends StatelessWidget {
  const FlashcardStyleEmptyPanel({
    super.key,
    required this.icon,
    required this.message,
    this.child,
  });

  final IconData icon;
  final String message;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        decoration: flashcardStylePanelDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 64, color: ColorPallete.disabled),
            const SizedBox(height: 16),
            Text(
              message,
              style: body.copyWith(fontWeight: FontWeight.bold),
            ),
            if (child != null) ...[const SizedBox(height: 24), child!],
          ],
        ),
      ),
    );
  }
}

class FlashcardStyleWordListPanel extends StatelessWidget {
  const FlashcardStyleWordListPanel({
    super.key,
    required this.countLabel,
    required this.countIcon,
    required this.subtitle,
    this.hint,
    required this.words,
    required this.itemBuilder,
  });

  final String countLabel;
  final IconData countIcon;
  final String subtitle;
  final String? hint;
  final List<WordEntity> words;
  final Widget Function(BuildContext context, WordEntity word) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: flashcardStylePanelDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(countIcon, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    countLabel,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              subtitle,
              style: body.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorPallete.primary,
                fontSize: 18,
              ),
            ),
          ),
          if (hint != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
              child: Text(
                hint!,
                style: caption.copyWith(color: ColorPallete.disabled),
              ),
            )
          else
            const SizedBox(height: 8),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 12),
              itemCount: words.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) =>
                  itemBuilder(context, words[index]),
            ),
          ),
        ],
      ),
    );
  }
}
