import 'package:flutter/material.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/typography.dart';

class FlashcardScreen extends StatefulWidget {
  const FlashcardScreen({super.key});

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen>
    with SingleTickerProviderStateMixin {
  String currentWord = "communicate";
  String partOfSpeech = "verb";
  bool isFlipped = false;

  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _flipAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _flipController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _flipController.dispose();
    super.dispose();
  }

  void _skipWord() {
    // TODO: Implement skip logic
    setState(() {
      // Change to next word
      currentWord = "example";
      partOfSpeech = "noun";
      isFlipped = false;
    });
    _flipController.reset();
  }

  void _addToBag() {
    // TODO: Implement add to bag logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Word added to bag!'),
        backgroundColor: ColorPallete.success,
      ),
    );
  }

  void _iKnew() {
    // TODO: Implement "I knew" logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Great job! You knew this word!'),
        backgroundColor: ColorPallete.success,
      ),
    );
  }

  void _flipCard() {
    if (isFlipped) {
      _flipController.reverse();
    } else {
      _flipController.forward();
    }
    setState(() {
      isFlipped = !isFlipped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // Light grey background like in image
      body: Padding(
        padding: const EdgeInsets.only(top: kToolbarHeight),
        child: Column(
          children: [
            // Header - left aligned with disabled color
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
                  "Flashcard",
                  style: body.copyWith(
                    color: ColorPallete.disabled,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.transparent,
                    size: 28,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Main Flashcard with single background card
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Single background card - flexible height
                      Container(
                        width: double.infinity,
                        height: double.infinity, // Flexible height
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ), // Reduce width
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
                      ),
                      // Main Flashcard (front) - flexible height
                      GestureDetector(
                        onTap: _flipCard,
                        child: AnimatedBuilder(
                          animation: _flipAnimation,
                          builder: (context, child) {
                            final flipValue = _flipAnimation.value;
                            final isHalfway = flipValue >= 0.5;

                            return Transform(
                              alignment: Alignment.center,
                              transform:
                                  Matrix4.identity()
                                    ..setEntry(3, 2, 0.001)
                                    ..rotateY(flipValue * 3.14159),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity, // Flexible height
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.12,
                                      ),
                                      blurRadius: 12,
                                      offset: const Offset(0, 6),
                                    ),
                                  ],
                                ),
                                margin: EdgeInsets.only(bottom: 16),
                                child: Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: Column(
                                    children: [
                                      // Top buttons row - these won't be flipped
                                      Transform(
                                        alignment: Alignment.center,
                                        transform:
                                            Matrix4.identity()..rotateY(
                                              !isHalfway ? 0 : 3.14159,
                                            ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            // Skip button
                                            GestureDetector(
                                              onTap: _skipWord,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 8,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .keyboard_double_arrow_left,
                                                      size: 16,
                                                      color: Colors.grey[600],
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                      'Skip',
                                                      style: TextStyle(
                                                        color: Colors.grey[600],
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),

                                            // Add to bag button
                                            GestureDetector(
                                              onTap: _addToBag,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 8,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .inventory_2_outlined,
                                                      size: 16,
                                                      color: Colors.grey[600],
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                      'Add to bag',
                                                      style: TextStyle(
                                                        color: Colors.grey[600],
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      const Spacer(),

                                      // Word display with flip animation
                                      isHalfway
                                          ? Transform(
                                            alignment: Alignment.center,
                                            transform:
                                                Matrix4.identity()
                                                  ..rotateY(3.14159),
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.lightbulb_outline,
                                                  size: 48,
                                                  color: ColorPallete.primary,
                                                ),
                                                const SizedBox(height: 16),
                                                Text(
                                                  'Definition',
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorPallete.primary,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  'To share or exchange information, news, or ideas',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey[600],
                                                    height: 1.4,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          )
                                          : Column(
                                            children: [
                                              Text(
                                                currentWord,
                                                style: const TextStyle(
                                                  fontSize: 48,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                '($partOfSpeech)',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.grey[600],
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                            ],
                                          ),

                                      const Spacer(),

                                      // Rotate hint - needs transform to remain readable when flipped
                                      Transform(
                                        alignment: Alignment.center,
                                        transform:
                                            Matrix4.identity()..rotateY(
                                              !isHalfway ? 0 : 3.14159,
                                            ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.rotate_right,
                                              size: 16,
                                              color: Colors.grey[400],
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              'Tap to rotate',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[400],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 56),
            // Bottom button - only this uses accent color
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _iKnew,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        ColorPallete.accent, // Only this button uses accent
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'I knew',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
