import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/typography.dart';
import 'package:learning_language_app/router/path.dart';
import 'package:learning_language_app/router/navigation_extensions.dart';
import 'package:learning_language_app/router/route_models.dart';
import 'package:learning_language_app/widgets/button/fill_button_widget.dart';
import 'package:learning_language_app/widgets/button/text_button_widget.dart';

class PuzzleResultScreen extends StatelessWidget {
  const PuzzleResultScreen({super.key, required this.args});

  final PuzzleResultArgs args;

  @override
  Widget build(BuildContext context) {
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
                          const Icon(
                            Icons.check_circle,
                            size: 72,
                            color: ColorPallete.success,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Correct!',
                            style: body.copyWith(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            args.word,
                            style: body.copyWith(
                              color: ColorPallete.warning,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Puzzle ${args.puzzleIndex}/${args.totalPuzzles}',
                            style: body.copyWith(color: Colors.white70),
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
                                  '+${args.scoreDelta}',
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: ColorPallete.accent,
                                  ),
                                ),
                                Text('points', style: caption),
                                if (args.isLastPuzzle) ...[
                                  const SizedBox(height: 12),
                                  Text(
                                    'Total: ${args.totalScore} points',
                                    style: body.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          if (!args.isLastPuzzle)
                            FillButtonWidget(
                              label: 'Next Puzzle',
                              textStyle: const TextStyle(color: Colors.white),
                              backgroundColor: ColorPallete.accent,
                              onPressed: () =>
                                  context.popOrGo(Paths.puzzle, result: true),
                            ),
                          if (!args.isLastPuzzle) const SizedBox(height: 12),
                          TextButtonWidget(
                            label: args.isLastPuzzle
                                ? 'Back to Word Store'
                                : 'Quit',
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
