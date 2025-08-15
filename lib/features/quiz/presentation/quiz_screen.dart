import 'package:flutter/material.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/typography.dart';
import 'package:learning_language_app/widgets/button/fill_button_widget.dart';
import 'package:learning_language_app/widgets/button/text_button_widget.dart';

class Word {
  final String text;
  final String type; // 'noun' atau 'verb'
  const Word(this.text, this.type);
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 4;
  int totalQuestions = 6;
  int timerSeconds = 30;

  int? _selectedAnswer = 0;
  final List<Word> _allWords = const [
    Word('Apple', 'noun'),
    Word('Banana', 'noun'),
    Word('Run', 'verb'),
    Word('Cherry', 'noun'),
    Word('Eat', 'verb'),
    Word('Fig', 'noun'),
    Word('Jump', 'verb'),
    Word('Grape', 'noun'),
    Word('Honeydew', 'noun'),
  ];

  final Map<String, Map<String, dynamic>> _wordDetails = {
    'Apple': {
      'synonyms': ['fruit', 'pome'],
      'antonyms': ['vegetable'],
      'definition':
          'A round fruit with red or green skin and a whitish interior.',
      'example': 'She ate an apple for breakfast.',
    },
    'Banana': {
      'synonyms': ['fruit', 'plantain'],
      'antonyms': ['vegetable'],
      'definition': 'A long curved fruit with a yellow skin.',
      'example': 'Monkeys love eating bananas.',
    },
    'Run': {
      'synonyms': ['sprint', 'jog'],
      'antonyms': ['walk', 'stand'],
      'definition': 'To move swiftly on foot.',
      'example': 'He likes to run every morning.',
    },
    'Cherry': {
      'synonyms': ['fruit', 'berry'],
      'antonyms': ['vegetable'],
      'definition':
          'A small, round fruit that is typically bright or dark red.',
      'example': 'She put a cherry on top of the cake.',
    },
    'Eat': {
      'synonyms': ['consume', 'devour'],
      'antonyms': ['fast', 'abstain'],
      'definition': 'To put food into the mouth, chew, and swallow it.',
      'example': 'We eat three meals a day.',
    },
    'Fig': {
      'synonyms': ['fruit'],
      'antonyms': ['vegetable'],
      'definition': 'A soft pear-shaped fruit with sweet dark flesh.',
      'example': 'Figs are often used in desserts.',
    },
    'Jump': {
      'synonyms': ['leap', 'hop'],
      'antonyms': ['fall', 'drop'],
      'definition': 'To push oneself off a surface and into the air.',
      'example': 'The cat can jump very high.',
    },
    'Grape': {
      'synonyms': ['fruit', 'berry'],
      'antonyms': ['vegetable'],
      'definition': 'A small round or oval fruit used to make wine.',
      'example': 'Grapes can be green or purple.',
    },
    'Honeydew': {
      'synonyms': ['melon', 'fruit'],
      'antonyms': ['vegetable'],
      'definition': 'A type of melon with sweet green flesh.',
      'example': 'Honeydew is refreshing in summer.',
    },
  };

  final String _hint = "Select your answer";

  List<String>? _currentOptions;
  int? _currentCorrectIndex;

  void _generateOptions() {
    final Word currentWord =
        _allWords[(currentQuestion - 1) % _allWords.length];
    final detail = _wordDetails[currentWord.text];
    List<String> distractors =
        _allWords
            .where((w) => w.text != currentWord.text)
            .map((w) => w.text)
            .toList();
    distractors.shuffle();
    List<String> options = [currentWord.text, ...distractors.take(3)];
    options.shuffle();
    _currentOptions = options;
    _currentCorrectIndex = options.indexOf(currentWord.text);
  }

  @override
  void initState() {
    super.initState();
    _generateOptions();
  }

  void _nextQuestion() {
    setState(() {
      if (currentQuestion < totalQuestions) {
        currentQuestion++;
        _selectedAnswer = null;
        _generateOptions();
      }
    });
  }

  void _prevQuestion() {
    setState(() {
      if (currentQuestion > 1) {
        currentQuestion--;
        _selectedAnswer = null;
        _generateOptions();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = currentQuestion / totalQuestions;

    final Word currentWord =
        _allWords[(currentQuestion - 1) % _allWords.length];
    final detail = _wordDetails[currentWord.text];
    String questionDefinition = detail?['definition'] ?? '';
    final options = _currentOptions ?? [];
    final correctIndex = _currentCorrectIndex ?? 0;

    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: Padding(
        padding: const EdgeInsets.only(top: kToolbarHeight),
        child: Column(
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: ColorPallete.disabled,
                    size: 28,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Text(
                  "Question $currentQuestion/$totalQuestions",
                  style: body.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Skip",
                    style: body.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
            // Progress Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 8,
                        backgroundColor: Color.lerp(
                          ColorPallete.primary,
                          Colors.white,
                          0.1,
                        ),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          ColorPallete.success,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Quiz Card
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Timer & Hint
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.question_mark,
                                    color: ColorPallete.success,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    _hint,
                                    style: caption.copyWith(
                                      color: ColorPallete.disabled,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
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
                                      '02:12',
                                      style: caption.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // Quiz Question
                          Text(
                            "(${currentWord.type}) ${questionDefinition.toLowerCase()}",
                            style: body.copyWith(
                              fontSize: 16,
                              color: ColorPallete.primary,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 16),
                          // Answer options as radio
                          Column(
                            children: List.generate(options.length, (index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        _selectedAnswer == index
                                            ? ColorPallete.accent
                                            : ColorPallete.disabled,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      _selectedAnswer == index
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
                                  onChanged: (val) {
                                    setState(() {
                                      _selectedAnswer = val;
                                    });
                                  },
                                  title: Text(
                                    options[index],
                                    style: body.copyWith(
                                      color: ColorPallete.primary,
                                    ),
                                  ),
                                  activeColor: ColorPallete.accent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(height: 32),
                          // Navigation Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButtonWidget(
                                label: "Back",
                                textStyle: const TextStyle(
                                  color: ColorPallete.primary,
                                  fontSize: 14,
                                ),
                                onPressed: _prevQuestion,
                                isDisabled: currentQuestion == 1,
                              ),
                              FillButtonWidget(
                                label: "Next",
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                backgroundColor: ColorPallete.accent,
                                onPressed: _nextQuestion,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
