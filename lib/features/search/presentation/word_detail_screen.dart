import 'package:flutter/material.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/injection/service_locator.dart';
import 'package:learning_language_app/const/typography.dart';
import 'package:learning_language_app/features/favorites/domain/usecases/add_favorite_usecase.dart';
import 'package:learning_language_app/features/favorites/domain/usecases/is_favorite_usecase.dart';
import 'package:learning_language_app/features/favorites/domain/usecases/remove_favorite_usecase.dart';
import 'package:learning_language_app/features/search/presentation/widgets/word_detail_sheet.dart';
import 'package:learning_language_app/features/word_store/domain/entities/word_entity.dart';
import 'package:learning_language_app/features/word_store/domain/usecases/add_cart_word_usecase.dart';
import 'package:learning_language_app/features/word_store/domain/usecases/get_word_by_word_usecase.dart';
import 'package:learning_language_app/router/navigation_extensions.dart';
import 'package:learning_language_app/router/path.dart';
import 'package:learning_language_app/widgets/button/fill_button_widget.dart';

class WordDetailScreen extends StatefulWidget {
  const WordDetailScreen({super.key, required this.word});

  final String word;

  @override
  State<WordDetailScreen> createState() => _WordDetailScreenState();
}

class _WordDetailScreenState extends State<WordDetailScreen> {
  final _getWord = sl<GetWordByWordUsecase>();
  final _addCart = sl<AddCartWordUsecase>();
  final _addFavorite = sl<AddFavoriteUsecase>();
  final _removeFavorite = sl<RemoveFavoriteUsecase>();
  final _isFavorite = sl<IsFavoriteUsecase>();

  WordEntity? _detail;
  bool _loading = true;
  bool _isFav = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final result = await _getWord.call(widget.word);
    if (!mounted) return;
    result.fold(
      (entity) async {
        final favResult = await _isFavorite.call(entity.id);
        if (!mounted) return;
        setState(() {
          _detail = entity;
          _loading = false;
          favResult.fold((v) => _isFav = v, (_) {});
        });
      },
      (error) => setState(() {
        _loading = false;
        _error = '$error';
      }),
    );
  }

  Future<void> _toggleFavorite() async {
    final detail = _detail;
    if (detail == null) return;
    if (_isFav) {
      await _removeFavorite.call(detail.id);
    } else {
      await _addFavorite.call(detail);
    }
    setState(() => _isFav = !_isFav);
  }

  Future<void> _addToBag() async {
    final detail = _detail;
    if (detail == null) return;
    final result = await _addCart.call(detail);
    if (!mounted) return;
    result.fold(
      (_) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Added to word bag'),
          backgroundColor: ColorPallete.success,
        ),
      ),
      (e) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$e'), backgroundColor: ColorPallete.danger),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.word),
        backgroundColor: Colors.white,
        foregroundColor: ColorPallete.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.popOrGo(Paths.home),
        ),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
          ? Center(child: Text(_error!, style: body))
          : Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: WordDetailContent(detail: _detail!),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: FillButtonWidget(
                          label: 'Add to bag',
                          textStyle: const TextStyle(color: Colors.white),
                          backgroundColor: ColorPallete.accent,
                          onPressed: _addToBag,
                        ),
                      ),
                      const SizedBox(width: 12),
                      IconButton.filled(
                        onPressed: _toggleFavorite,
                        icon: Icon(
                          _isFav ? Icons.favorite : Icons.favorite_border,
                          color: Colors.white,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: ColorPallete.danger,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
