import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/injection/service_locator.dart';
import 'package:learning_language_app/const/typography.dart';
import 'package:learning_language_app/features/puzzle/data/data_sources/puzzle_session_data_source.dart';
import 'package:learning_language_app/features/puzzle/data/models/puzzle_session_models.dart';
import 'package:learning_language_app/router/navigation_extensions.dart';
import 'package:learning_language_app/router/path.dart';
import 'package:learning_language_app/router/route_models.dart';

class PuzzleScreen extends StatefulWidget {
  const PuzzleScreen({super.key});

  @override
  State<PuzzleScreen> createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen>
    with SingleTickerProviderStateMixin {
  static const int _totalQuestions = 6;
  final _puzzleSession = sl<PuzzleSessionDataSource>();

  int currentQuestion = 1;
  int _totalScore = 0;
  String? _sessionId;
  bool _isLoading = true;
  String? _errorMessage;

  List<String> _characters = [];
  List<String?> _userAnswer = [];
  List<int> _selectedIndexes = [];

  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _shakeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _shakeController, curve: Curves.elasticIn),
    );
    _startSession();
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  Future<void> _startSession() async {
    try {
      final session = await _puzzleSession.startSession(
        questionCount: _totalQuestions,
      );
      setState(() {
        _sessionId = session.sessionId;
        _isLoading = false;
        _setupPuzzle(session.puzzle);
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = '$e';
      });
    }
  }

  void _setupPuzzle(PuzzleDataModel puzzle) {
    _characters = puzzle.letterGrid.map((c) => c.toUpperCase()).toList();
    _userAnswer = List.filled(puzzle.answerLength, null);
    _selectedIndexes = [];
  }

  Future<void> _checkWin() async {
    final sessionId = _sessionId;
    if (sessionId == null) return;
    final attempt = _userAnswer.join('');
    if (attempt.length != _userAnswer.length) return;

    try {
      final result = await _puzzleSession.submitAnswer(
        sessionId: sessionId,
        answer: attempt,
        elapsedSeconds: 0,
      );

      if (!result.correct) {
        _shakeController.forward(from: 0);
        return;
      }

      final scoreDelta = result.scoreDelta;
      _totalScore = result.totalScore;
      final isLast = result.completed || currentQuestion >= _totalQuestions;

      if (!mounted) return;
      await context
          .push<bool>(
            Paths.puzzleResult,
            extra: PuzzleResultArgs(
              word: attempt,
              puzzleIndex: currentQuestion,
              totalPuzzles: _totalQuestions,
              scoreDelta: scoreDelta,
              isLastPuzzle: isLast,
              totalScore: _totalScore,
            ),
          )
          .then((next) {
            if (!mounted || isLast) return;
            if (next == true) {
              final nextPuzzle = result.nextPuzzle;
              if (nextPuzzle != null) {
                setState(() {
                  currentQuestion++;
                  _setupPuzzle(nextPuzzle);
                });
              }
            }
          });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit puzzle: $e')),
      );
    }
  }

  void _onCharTap(int charIndex) {
    if (_selectedIndexes.contains(charIndex)) return;
    final char = _characters[charIndex];
    final pos = _userAnswer.indexWhere((e) => e == null);
    if (pos == -1) return;
    setState(() {
      _userAnswer[pos] = char;
      _selectedIndexes.add(charIndex);
    });
    if (_userAnswer.every((e) => e != null)) {
      _checkWin();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: ColorPallete.primary,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }

    if (_errorMessage != null) {
      return Scaffold(
        backgroundColor: ColorPallete.primary,
        body: Center(
          child: Text(
            _errorMessage!,
            style: body.copyWith(color: Colors.white),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: Padding(
        padding: const EdgeInsets.only(top: kToolbarHeight),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: ColorPallete.disabled,
                    size: 28,
                  ),
                  onPressed: () => context.popOrGo(Paths.wordStore),
                ),
                Text(
                  '$currentQuestion/$_totalQuestions',
                  style: body.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.settings_outlined,
                    color: ColorPallete.disabled,
                    size: 28,
                  ),
                  onPressed: () => context.popOrGo(Paths.wordStore),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemCount: _characters.length,
                  itemBuilder: (context, index) {
                    final isSelected = _selectedIndexes.contains(index);
                    return ElevatedButton(
                      onPressed: () => _onCharTap(index),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isSelected ? ColorPallete.success : Colors.white,
                        foregroundColor: ColorPallete.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 2,
                        textStyle: body.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      child: Text(
                        _characters[index],
                        style: TextStyle(
                          color:
                              isSelected ? Colors.white : ColorPallete.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _shakeController,
              builder: (context, child) {
                const amplitude = 16.0;
                final offset = amplitude *
                    (_shakeAnimation.value % 2 == 0 ? 1 : -1) *
                    math.sin(_shakeAnimation.value * math.pi * 4);
                return Transform.translate(
                  offset: Offset(offset, 0),
                  child: child,
                );
              },
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 32, top: 8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: List.generate(_userAnswer.length, (i) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _userAnswer[i] ?? '',
                                style: body.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              Container(
                                height: 2,
                                width: 24,
                                color: Colors.white,
                                margin: const EdgeInsets.only(top: 4),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
