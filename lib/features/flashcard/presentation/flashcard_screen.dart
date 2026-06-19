import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/injection/service_locator.dart';
import 'package:learning_language_app/const/typography.dart';
import 'package:learning_language_app/features/flashcard/data/data_sources/flashcard_session_data_source.dart';
import 'package:learning_language_app/features/flashcard/data/models/flashcard_session_models.dart';
import 'package:learning_language_app/features/word_store/domain/entities/word_entity.dart';
import 'package:learning_language_app/features/word_store/domain/usecases/add_cart_word_usecase.dart';
import 'package:learning_language_app/router/navigation_extensions.dart';
import 'package:learning_language_app/router/path.dart';
import 'package:learning_language_app/router/route_models.dart';

class FlashcardScreen extends StatefulWidget {
  const FlashcardScreen({super.key});

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen>
    with SingleTickerProviderStateMixin {
  final _flashcardSession = sl<FlashcardSessionDataSource>();
  final _addCartWord = sl<AddCartWordUsecase>();

  List<FlashcardCardModel> _cards = [];
  String? _sessionId;
  int _currentIndex = 0;
  bool _isLoading = true;
  String? _errorMessage;
  bool isFlipped = false;

  int _knewCount = 0;
  int _skipCount = 0;
  int _addedToBagCount = 0;
  int _pointsAwarded = 0;

  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  FlashcardCardModel? get _currentCard =>
      _cards.isEmpty || _currentIndex >= _cards.length
          ? null
          : _cards[_currentIndex];

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
    _loadWords();
  }

  Future<void> _loadWords() async {
    try {
      final session = await _flashcardSession.startSession(deckSize: 10);
      setState(() {
        _sessionId = session.sessionId;
        _cards = session.cards;
        _isLoading = false;
        _errorMessage = null;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = '$e';
      });
    }
  }

  @override
  void dispose() {
    _flipController.dispose();
    super.dispose();
  }

  void _resetFlip() {
    if (isFlipped) {
      _flipController.reverse();
      isFlipped = false;
    } else {
      _flipController.reset();
    }
  }

  void _goToSummary() {
    context.push(
      Paths.flashcardSummary,
      extra: FlashcardSummaryArgs(
        knewCount: _knewCount,
        skipCount: _skipCount,
        totalCards: _cards.length,
        addedToBagCount: _addedToBagCount,
        pointsAwarded: _pointsAwarded,
      ),
    );
  }

  Future<void> _advance({required bool knew}) async {
    final sessionId = _sessionId;
    final card = _currentCard;
    if (sessionId == null || card == null) return;

    try {
      final result = await _flashcardSession.reviewCard(
        sessionId: sessionId,
        wordId: card.wordId,
        result: knew ? 'knew' : 'skip',
      );
      if (knew) {
        _knewCount++;
      } else {
        _skipCount++;
      }

      if (result.sessionComplete && result.sessionSummary != null) {
        _pointsAwarded = result.sessionSummary!.pointsAwarded;
        if (!mounted) return;
        _goToSummary();
        return;
      }

      final next = result.nextIndex;
      if (next >= _cards.length) {
        if (!mounted) return;
        _goToSummary();
        return;
      }
      setState(() {
        _currentIndex = next;
        _resetFlip();
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit review: $e')),
      );
    }
  }

  void _skipWord() => _advance(knew: false);

  Future<void> _addToBag() async {
    final card = _currentCard;
    if (card == null) return;
    final word = WordEntity(
      id: card.wordId,
      word: card.word,
      definition: card.definition,
      example: card.example,
      type: card.type,
    );
    final result = await _addCartWord.call(word);
    if (!mounted) return;
    result.fold(
      (_) {
        setState(() => _addedToBagCount++);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Word added to bag!'),
            backgroundColor: ColorPallete.success,
          ),
        );
      },
      (error) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed: $error'),
          backgroundColor: ColorPallete.danger,
        ),
      ),
    );
  }

  void _iKnew() => _advance(knew: true);

  void _flipCard() {
    if (isFlipped) {
      _flipController.reverse();
    } else {
      _flipController.forward();
    }
    setState(() => isFlipped = !isFlipped);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: Colors.grey[50],
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_errorMessage != null || _currentCard == null) {
      return Scaffold(
        backgroundColor: Colors.grey[50],
        body: Center(child: Text(_errorMessage ?? 'No words available')),
      );
    }

    final card = _currentCard!;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Flashcard',
                      style: body.copyWith(
                        color: ColorPallete.disabled,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${_currentIndex + 1}/${_cards.length}',
                      style: caption.copyWith(color: ColorPallete.disabled),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: _goToSummary,
                  child: Text(
                    'End',
                    style: body.copyWith(color: ColorPallete.accent),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
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
                      GestureDetector(
                        onTap: _flipCard,
                        child: AnimatedBuilder(
                          animation: _flipAnimation,
                          builder: (context, child) {
                            final flipValue = _flipAnimation.value;
                            final isHalfway = flipValue >= 0.5;

                            return Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.001)
                                ..rotateY(flipValue * 3.14159),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                margin: const EdgeInsets.only(bottom: 16),
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
                                child: Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: Column(
                                    children: [
                                      Transform(
                                        alignment: Alignment.center,
                                        transform: Matrix4.identity()
                                          ..rotateY(!isHalfway ? 0 : 3.14159),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            _TopActionButton(
                                              label: 'Skip',
                                              icon: Icons
                                                  .keyboard_double_arrow_left,
                                              onTap: _skipWord,
                                            ),
                                            _TopActionButton(
                                              label: 'Add to bag',
                                              icon: Icons.inventory_2_outlined,
                                              onTap: _addToBag,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      isHalfway
                                          ? Transform(
                                              alignment: Alignment.center,
                                              transform: Matrix4.identity()
                                                ..rotateY(3.14159),
                                              child: Column(
                                                children: [
                                                  const Icon(
                                                    Icons.lightbulb_outline,
                                                    size: 48,
                                                    color: ColorPallete.primary,
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Text(
                                                    'Definition',
                                                    style: const TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          ColorPallete.primary,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Text(
                                                    card.definition,
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
                                                  card.word,
                                                  style: const TextStyle(
                                                    fontSize: 48,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  '(${card.type})',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.grey[600],
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                                ),
                                              ],
                                            ),
                                      const Spacer(),
                                      Transform(
                                        alignment: Alignment.center,
                                        transform: Matrix4.identity()
                                          ..rotateY(!isHalfway ? 0 : 3.14159),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _iKnew,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPallete.accent,
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

class _TopActionButton extends StatelessWidget {
  const _TopActionButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: Colors.grey[600]),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
