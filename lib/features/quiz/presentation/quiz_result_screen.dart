import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/typography.dart';
import 'package:learning_language_app/router/navigation_extensions.dart';
import 'package:learning_language_app/router/path.dart';
import 'package:learning_language_app/router/route_models.dart';
import 'package:learning_language_app/widgets/button/fill_button_widget.dart';
import 'package:learning_language_app/widgets/button/text_button_widget.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key, required this.args});

  final QuizResultArgs args;

  @override
  Widget build(BuildContext context) {
    final percent = args.totalQuestions == 0
        ? 0
        : ((args.correctCount / args.totalQuestions) * 100).round();

    return Scaffold(
      backgroundColor: ColorPallete.primary,
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
                          Icon(
                            percent >= 70
                                ? Icons.emoji_events
                                : Icons.quiz_outlined,
                            size: 72,
                            color: ColorPallete.warning,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Quiz Complete!',
                            style: body.copyWith(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${args.correctCount}/${args.totalQuestions} correct',
                            style: body.copyWith(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '+${args.score}',
                                  style: const TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: ColorPallete.accent,
                                  ),
                                ),
                                Text('points earned', style: caption),
                                if (args.wrongWords.isNotEmpty) ...[
                                  const SizedBox(height: 16),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Review:',
                                      style: body.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Wrap(
                                    spacing: 8,
                                    children: args.wrongWords
                                        .map(
                                          (w) => Chip(
                                            label: Text(w),
                                            backgroundColor:
                                                ColorPallete.background,
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ],
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
                                  context.replace(Paths.quiz);
                                }
                              } else {
                                context.go(Paths.quiz);
                              }
                            },
                          ),
                          const SizedBox(height: 12),
                          TextButtonWidget(
                            label: 'Back to Word Store',
                            textStyle: const TextStyle(color: Colors.white),
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
