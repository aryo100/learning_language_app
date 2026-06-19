import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/injection/service_locator.dart';
import 'package:learning_language_app/const/typography.dart';
import 'package:learning_language_app/features/quiz/data/data_sources/quiz_session_data_source.dart';
import 'package:learning_language_app/features/quiz/data/models/quiz_session_models.dart';
import 'package:learning_language_app/router/path.dart';
import 'package:learning_language_app/router/navigation_extensions.dart';
import 'package:learning_language_app/router/route_models.dart';
import 'package:learning_language_app/widgets/button/fill_button_widget.dart';
import 'package:learning_language_app/widgets/button/text_button_widget.dart';

enum _QuizPhase { intro, play }

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  static const int _totalQuestions = 6;
  final _quizSession = sl<QuizSessionDataSource>();

  _QuizPhase _phase = _QuizPhase.intro;
  int currentQuestion = 1;
  int? _selectedAnswer;
  String? _sessionId;
  List<QuizQuestionModel> _questions = [];
  bool _isLoading = false;
  String? _errorMessage;
  final Map<int, bool> _answers = {};
  final List<String> _wrongWords = [];
  int _elapsedSeconds = 0;
  int _questionElapsed = 0;
  Timer? _timer;

  QuizQuestionModel? get _currentQuestion =>
      _questions.isEmpty ? null : _questions[currentQuestion - 1];

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _startQuiz() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      final session =
          await _quizSession.startSession(questionCount: _totalQuestions);
      if (session.questions.length < _totalQuestions) {
        throw Exception('Not enough quiz questions from server');
      }
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        setState(() {
          _elapsedSeconds++;
          _questionElapsed++;
        });
      });
      setState(() {
        _sessionId = session.sessionId;
        _questions = session.questions;
        _isLoading = false;
        _phase = _QuizPhase.play;
        _questionElapsed = 0;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = '$e';
      });
    }
  }

  Future<void> _submitCurrentAnswer({required bool skipped}) async {
    final sessionId = _sessionId;
    final question = _currentQuestion;
    if (sessionId == null || question == null) return;

    final selectedIndex = skipped ? -1 : (_selectedAnswer ?? -1);
    final result = await _quizSession.submitAnswer(
      sessionId: sessionId,
      questionId: question.id,
      selectedIndex: selectedIndex,
      elapsedSeconds: _questionElapsed,
    );
    _answers[currentQuestion] = result.correct;
    if (!result.correct && !skipped) {
      final word = question.options.isNotEmpty
          ? question.options[selectedIndex.clamp(0, question.options.length - 1)]
          : question.prompt;
      if (!_wrongWords.contains(word)) _wrongWords.add(word);
    }
    _questionElapsed = 0;
  }

  Future<void> _finishQuiz() async {
    final sessionId = _sessionId;
    if (sessionId == null) return;
    try {
      await _submitCurrentAnswer(skipped: false);
      _timer?.cancel();
      final complete = await _quizSession.completeSession(sessionId);
      if (!mounted) return;
      context.push(
        Paths.quizResult,
        extra: QuizResultArgs(
          correctCount: complete.correctCount,
          totalQuestions: complete.questionCount,
          score: complete.pointsAwarded,
          wrongWords: _wrongWords,
          timeSpentSeconds: _elapsedSeconds,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to complete quiz: $e')),
      );
    }
  }

  Future<void> _nextOrFinish() async {
    if (currentQuestion >= _totalQuestions) {
      await _finishQuiz();
      return;
    }
    try {
      await _submitCurrentAnswer(skipped: false);
      setState(() {
        currentQuestion++;
        _selectedAnswer = null;
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit answer: $e')),
      );
    }
  }

  Future<void> _skipQuestion() async {
    if (currentQuestion >= _totalQuestions) {
      try {
        await _submitCurrentAnswer(skipped: true);
        await _finishQuiz();
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to skip: $e')),
        );
      }
      return;
    }
    try {
      await _submitCurrentAnswer(skipped: true);
      setState(() {
        currentQuestion++;
        _selectedAnswer = null;
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to skip: $e')),
      );
    }
  }

  void _prevQuestion() {
    if (currentQuestion <= 1) return;
    setState(() {
      currentQuestion--;
      _selectedAnswer = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_phase == _QuizPhase.intro) {
      return Scaffold(
        backgroundColor: ColorPallete.primary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => context.popOrGo(Paths.wordStore),
                  ),
                ),
                const Spacer(),
                const Icon(Icons.quiz, size: 72, color: ColorPallete.warning),
                const SizedBox(height: 16),
                Text(
                  'Ready for Quiz?',
                  style: body.copyWith(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '$_totalQuestions questions · Pick the word that matches the definition',
                  style: body.copyWith(color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
                if (_errorMessage != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    _errorMessage!,
                    style: body.copyWith(color: ColorPallete.danger),
                    textAlign: TextAlign.center,
                  ),
                ],
                const Spacer(),
                FillButtonWidget(
                  label: _isLoading ? '' : 'Start',
                  prefixIcon: _isLoading
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : null,
                  textStyle: const TextStyle(color: Colors.white),
                  backgroundColor: ColorPallete.accent,
                  isDisabled: _isLoading,
                  onPressed: _startQuiz,
                ),
              ],
            ),
          ),
        ),
      );
    }

    final question = _currentQuestion;
    if (question == null) {
      return Scaffold(
        backgroundColor: ColorPallete.primary,
        body: Center(
          child: Text(
            'Failed to load quiz',
            style: body.copyWith(color: Colors.white),
          ),
        ),
      );
    }

    final progress = currentQuestion / _totalQuestions;
    final options = question.options;
    final isLast = currentQuestion >= _totalQuestions;

    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: ColorPallete.disabled),
                  onPressed: () => context.popOrGo(Paths.wordStore),
                ),
                Text(
                  'Question $currentQuestion/$_totalQuestions',
                  style: body.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: _skipQuestion,
                  child: Text('Skip', style: body.copyWith(color: Colors.white)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 8,
                  backgroundColor:
                      Color.lerp(ColorPallete.primary, Colors.white, 0.1),
                  valueColor: const AlwaysStoppedAnimation(ColorPallete.success),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Select your answer',
                                style: caption,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: ColorPallete.accent,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                '${(_elapsedSeconds ~/ 60).toString().padLeft(2, '0')}:${(_elapsedSeconds % 60).toString().padLeft(2, '0')}',
                                style: caption.copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '(${question.type}) ${question.prompt.toLowerCase()}',
                          style: body.copyWith(color: ColorPallete.primary),
                        ),
                        const SizedBox(height: 16),
                        ...List.generate(options.length, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _selectedAnswer == index
                                    ? ColorPallete.accent
                                    : ColorPallete.disabled,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: _selectedAnswer == index
                                  ? Color.lerp(
                                      ColorPallete.accent,
                                      Colors.white,
                                      0.8,
                                    )
                                  : Colors.white,
                            ),
                            child: RadioListTile<int>(
                              value: index,
                              groupValue: _selectedAnswer,
                              onChanged: (v) =>
                                  setState(() => _selectedAnswer = v),
                              title: Text(
                                options[index],
                                style: body,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              activeColor: ColorPallete.accent,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButtonWidget(
                    label: 'Back',
                    textStyle: const TextStyle(color: Colors.white),
                    onPressed: _prevQuestion,
                    isDisabled: currentQuestion == 1,
                  ),
                  FillButtonWidget(
                    label: isLast ? 'Finish' : 'Next',
                    textStyle: const TextStyle(color: Colors.white),
                    backgroundColor: ColorPallete.accent,
                    onPressed: _nextOrFinish,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
