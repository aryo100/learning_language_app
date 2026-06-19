import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/typography.dart';
import 'package:learning_language_app/router/navigation_extensions.dart';
import 'package:learning_language_app/router/path.dart';
import 'package:learning_language_app/router/route_models.dart';
import 'package:learning_language_app/widgets/button/fill_button_widget.dart';
import 'package:learning_language_app/widgets/button/text_button_widget.dart';

class FlashcardSummaryScreen extends StatelessWidget {
  const FlashcardSummaryScreen({super.key, required this.args});

  final FlashcardSummaryArgs args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.style,
                            size: 72,
                            color: ColorPallete.accent,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Session Complete',
                            style: body.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.08),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                _StatRow(
                                  label: 'You knew',
                                  value: '${args.knewCount}',
                                  color: ColorPallete.success,
                                ),
                                const Divider(),
                                _StatRow(
                                  label: 'Skipped',
                                  value: '${args.skipCount}',
                                  color: ColorPallete.disabled,
                                ),
                                const Divider(),
                                _StatRow(
                                  label: 'Added to bag',
                                  value: '${args.addedToBagCount}',
                                  color: ColorPallete.accent,
                                ),
                                if (args.pointsAwarded > 0) ...[
                                  const Divider(),
                                  _StatRow(
                                    label: 'Points earned',
                                    value: '+${args.pointsAwarded}',
                                    color: ColorPallete.warning,
                                  ),
                                ],
                                const SizedBox(height: 8),
                                Text(
                                  '${args.totalCards} cards reviewed',
                                  style: caption,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          FillButtonWidget(
                            label: 'Play Again',
                            textStyle: const TextStyle(color: Colors.white),
                            backgroundColor: ColorPallete.accent,
                            onPressed: () {
                              if (canSafelyPop(context)) {
                                context.pop();
                                if (context.mounted) {
                                  context.replace(Paths.flashcard);
                                }
                              } else {
                                context.go(Paths.flashcard);
                              }
                            },
                          ),
                          const SizedBox(height: 12),
                          TextButtonWidget(
                            label: 'Back to Word Store',
                            textStyle: const TextStyle(
                              color: ColorPallete.primary,
                            ),
                            onPressed: () => context.go(Paths.wordStore),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: body),
          Text(
            value,
            style: body.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
