import 'package:flutter/material.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/injection/service_locator.dart';
import 'package:learning_language_app/const/typography.dart';
import 'package:learning_language_app/features/favorites/domain/usecases/get_favorites_usecase.dart';
import 'package:learning_language_app/features/favorites/domain/usecases/remove_favorite_usecase.dart';
import 'package:learning_language_app/features/search/presentation/widgets/word_detail_sheet.dart';
import 'package:learning_language_app/features/word_store/domain/entities/word_entity.dart';
import 'package:learning_language_app/router/navigation_extensions.dart';
import 'package:learning_language_app/router/path.dart';
import 'package:learning_language_app/widgets/flashcard_style_scaffold.dart';
import 'package:learning_language_app/widgets/flashcard_style_word_list_panel.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final _getFavorites = sl<GetFavoritesUsecase>();
  final _removeFavorite = sl<RemoveFavoriteUsecase>();

  List<WordEntity> _words = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final result = await _getFavorites.call();
    if (!mounted) return;
    result.fold(
      (words) => setState(() {
        _words = words;
        _loading = false;
      }),
      (_) => setState(() => _loading = false),
    );
  }

  Future<void> _remove(String id) async {
    await _removeFavorite.call(id);
    await _load();
  }

  @override
  Widget build(BuildContext context) {
    return FlashcardStyleScaffold.page(
      title: 'Favorites',
      onBack: () => context.popOrGo(Paths.home),
      child: _loading
          ? const Center(child: CircularProgressIndicator())
          : _words.isEmpty
          ? const FlashcardStyleEmptyPanel(
              icon: Icons.favorite_border,
              message: 'No favorites yet',
            )
          : Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
              child: FlashcardStyleWordListPanel(
                countLabel: '${_words.length} words',
                countIcon: Icons.favorite,
                subtitle: 'Saved favorites',
                words: _words,
                itemBuilder: (context, word) => ListTile(
                  title: Text(word.word, style: body),
                  subtitle: word.type.isNotEmpty
                      ? Text(word.type, style: caption)
                      : null,
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      color: ColorPallete.danger,
                    ),
                    onPressed: () => _remove(word.id),
                  ),
                  onTap: () => showWordDetailSheet(context, word),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 2,
                  ),
                ),
              ),
            ),
    );
  }
}
