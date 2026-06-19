import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/injection/service_locator.dart';
import 'package:learning_language_app/const/typography.dart';
import 'package:learning_language_app/features/search/presentation/widgets/word_detail_sheet.dart';
import 'package:learning_language_app/features/word_store/domain/entities/word_entity.dart';
import 'package:learning_language_app/features/word_store/domain/usecases/search_words_usecase.dart';
import 'package:learning_language_app/router/navigation_extensions.dart';
import 'package:learning_language_app/router/path.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static const int _listLimit = 5;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  final _searchWords = sl<SearchWordsUsecase>();

  List<WordEntity> _results = [];
  List<String> _searchHistory = [];
  bool _isLoading = false;
  String? _errorMessage;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onSearchChanged);
    _fetchWords('');
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      _fetchWords(_controller.text.trim());
    });
    setState(() {});
  }

  Future<void> _fetchWords(String query) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    final result = await _searchWords.call(query);
    if (!mounted) return;
    result.fold(
      (words) => setState(() {
        _results = words;
        _isLoading = false;
      }),
      (error) => setState(() {
        _isLoading = false;
        _errorMessage = '$error';
      }),
    );
  }

  void _addToHistory(String word) {
    setState(() {
      _searchHistory.remove(word);
      _searchHistory.insert(0, word);
      if (_searchHistory.length > 10) {
        _searchHistory = _searchHistory.sublist(0, 10);
      }
    });
  }

  void _openWordDetail(BuildContext context, WordEntity word) {
    _addToHistory(word.word);
    showWordDetailSheet(context, word);
  }

  List<WordEntity> get _historyWords => _searchHistory
      .map(
        (text) => _results.firstWhere(
          (w) => w.word == text,
          orElse: () => WordEntity(
            id: text,
            word: text,
            definition: '',
            example: '',
            type: '',
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    final isQueryEmpty = _controller.text.isEmpty;
    final showHistory = !isQueryEmpty && _searchHistory.isNotEmpty;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: ColorPallete.disabled,
                      size: 28,
                    ),
                    onPressed: () => context.popOrGo(Paths.wordStore),
                  ),
                  Expanded(child: _SearchInput(controller: _controller)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            if (_isLoading)
              const Expanded(
                child: Center(child: CircularProgressIndicator()),
              )
            else if (_errorMessage != null)
              Expanded(
                child: Center(
                  child: Text(
                    _errorMessage!,
                    style: body.copyWith(color: ColorPallete.danger),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            else if (isQueryEmpty)
              Expanded(
                child: _SearchResultList(
                  words: _results.take(SearchScreen._listLimit).toList(),
                  onWordTap: (word) => _openWordDetail(context, word),
                ),
              )
            else
              Expanded(
                child: ListView(
                  children: [
                    _SearchResultList(
                      words: _results.take(SearchScreen._listLimit).toList(),
                      onWordTap: (word) => _openWordDetail(context, word),
                    ),
                    if (showHistory) ...[
                      const _SearchDivider(),
                      _SearchResultList(
                        words: _historyWords,
                        onWordTap: (word) {
                          _controller.text = word.word;
                          _fetchWords(word.word);
                          _openWordDetail(context, word);
                        },
                      ),
                    ],
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _SearchInput extends StatelessWidget {
  const _SearchInput({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: body,
      decoration: InputDecoration(
        hintText: 'Search...',
        prefixIcon: const Icon(Icons.search, color: ColorPallete.disabled),
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.close, color: Colors.grey),
                onPressed: () {
                  controller.clear();
                  FocusScope.of(context).unfocus();
                },
              )
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: ColorPallete.disabled),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: ColorPallete.disabled),
        ),
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    );
  }
}

class _SearchDivider extends StatelessWidget {
  const _SearchDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: ColorPallete.background,
        border: Border(
          bottom: BorderSide(color: ColorPallete.disabled, width: 1),
        ),
      ),
      child: Text(
        'Are you looking for?',
        style: caption.copyWith(
          color: ColorPallete.disabled,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _SearchResultList extends StatelessWidget {
  const _SearchResultList({required this.words, this.onWordTap});

  final List<WordEntity> words;
  final ValueChanged<WordEntity>? onWordTap;

  @override
  Widget build(BuildContext context) {
    if (words.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.search_off_rounded,
              size: 48,
              color: ColorPallete.disabled,
            ),
            const SizedBox(height: 12),
            Text(
              'No results found',
              style: caption.copyWith(
                color: ColorPallete.disabled,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }
    return ListView.separated(
      itemCount: words.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _SearchWordTile(
          word: words[index],
          onTap: () => onWordTap?.call(words[index]),
        );
      },
    );
  }
}

class _SearchWordTile extends StatelessWidget {
  const _SearchWordTile({required this.word, this.onTap});

  final WordEntity word;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(word.word, style: body),
      subtitle: word.type.isNotEmpty
          ? Text(
              word.type,
              style: caption.copyWith(color: ColorPallete.disabled),
            )
          : null,
      trailing: const Icon(
        Icons.content_copy_rounded,
        size: 24,
        color: ColorPallete.disabled,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
    );
  }
}
