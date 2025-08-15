import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/typography.dart';

class PuzzleScreen extends StatefulWidget {
  const PuzzleScreen({super.key});

  @override
  State<PuzzleScreen> createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> with SingleTickerProviderStateMixin {
  int currentQuestion = 4;
  int totalQuestions = 6;

  final String _answer = "APPLE";
  final List<String> _characters = [
    "A", "P", "P", "L",
    "E", "B", "C", "D",
    "F", "G", "H", "I",
    "J", "K", "M", "N",
  ];

  List<String?> _userAnswer = [];
  List<int> _selectedIndexes = [];

  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _userAnswer = List.filled(_answer.length, null);
    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _shakeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _shakeController, curve: Curves.elasticIn),
    );
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  void _onCharTap(int charIndex) {
    final char = _characters[charIndex];
    // Cek apakah char ada di answer dan masih ada slot kosong untuk char tsb
    int? pos;
    for (int i = 0; i < _answer.length; i++) {
      if (_userAnswer[i] == null && _answer[i] == char) {
        pos = i;
        break;
      }
    }
    if (pos != null) {
      setState(() {
        _userAnswer[pos!] = char;
        _selectedIndexes.add(charIndex);
      });
    } else {
      // Salah, trigger shake
      _shakeController.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () => Navigator.of(context).maybePop(),
                ),
                Text(
                  "$currentQuestion/$totalQuestions",
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
                  onPressed: () => Navigator.of(context).maybePop(),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Grid 4x4 karakter (scrollable if overflow)
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
                        backgroundColor: isSelected
                            ? ColorPallete.success
                            : Colors.white,
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
                          color: isSelected
                              ? Colors.white
                              : ColorPallete.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // Hint underline di bawah, warna putih, shake jika salah
            AnimatedBuilder(
              animation: _shakeController,
              builder: (context, child) {
                // Amplitude shake (misal 16)
                const double amplitude = 16;
                // Sinusoidal shake, start & end at 0
                final double offset = amplitude * (_shakeAnimation.value % 2 == 0 ? 1 : -1) *
                  (math.sin(_shakeAnimation.value * math.pi * 4));
                  print("Shake offset: $offset");
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
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: List.generate(_answer.length, (i) {
                        final char = _userAnswer[i];
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                char ?? "",
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
