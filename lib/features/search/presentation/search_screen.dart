import 'package:flutter/material.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/typography.dart';

class Word {
  final String text;
  final String type; // 'noun' atau 'verb'
  const Word(this.text, this.type);
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
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
  List<Word> _filteredWords = [];
  List<String> _searchHistory = [];

  // Dummy data detail, bisa diganti dengan data asli
  final Map<String, Map<String, dynamic>> _wordDetails = {
    'Apple': {
      'synonyms': ['fruit', 'pome'],
      'antonyms': ['vegetable'],
      'definition':
          'A round fruit with red or green skin and a whitish interior.',
      'example': 'She ate an apple for breakfast.',
    },
    'Run': {
      'synonyms': ['sprint', 'jog'],
      'antonyms': ['walk', 'stand'],
      'definition': 'To move swiftly on foot.',
      'example': 'He likes to run every morning.',
    },
    // ...tambahkan detail untuk kata lain...
  };

  @override
  void initState() {
    super.initState();
    _filteredWords = _allWords;
    _controller.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _controller.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredWords = _allWords;
      } else {
        _filteredWords =
            _allWords
                .where((word) => word.text.toLowerCase().contains(query))
                .toList();
      }
    });
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

  void _showWordDetail(BuildContext context, Word word) {
    final detail = _wordDetails[word.text];
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child:
                  detail == null
                      ? Center(
                        child: Text('No detail available for "${word.text}"'),
                      )
                      : SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  word.text,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.content_copy_rounded,
                                  color: ColorPallete.disabled,
                                  size: 20,
                                ),
                              ],
                            ),
                            Text("(${word.type})", style: caption),
                            const SizedBox(height: 8),
                            Divider(color: ColorPallete.background),
                            ExpansionTile(
                              tilePadding: EdgeInsets.zero,
                              childrenPadding: EdgeInsets.zero,
                              title: Text(
                                'Synonyms',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorPallete.accent,
                                ),
                              ),
                              iconColor: ColorPallete.accent,
                              visualDensity: VisualDensity.compact,
                              minTileHeight: 0,
                              shape: const RoundedRectangleBorder(),
                              collapsedShape: const RoundedRectangleBorder(),
                              initiallyExpanded: true,
                              expandedAlignment: Alignment.centerLeft,
                              children: [
                                Wrap(
                                  spacing: 8,
                                  children:
                                      (detail['synonyms'] as List<dynamic>? ??
                                              [])
                                          .map(
                                            (s) => Chip(
                                              label: Text(
                                                s,
                                                style: body.copyWith(
                                                  color: ColorPallete.accent,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              backgroundColor: Colors.white,
                                              padding: EdgeInsets.zero,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                side: BorderSide(
                                                  color: ColorPallete.accent,
                                                  width: 1.5,
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              tilePadding: EdgeInsets.zero,
                              childrenPadding: EdgeInsets.zero,
                              title: Text(
                                'Antonyms',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorPallete.accent,
                                ),
                              ),
                              iconColor: ColorPallete.accent,
                              visualDensity: VisualDensity.compact,
                              minTileHeight: 0,
                              shape: const RoundedRectangleBorder(),
                              collapsedShape: const RoundedRectangleBorder(),
                              initiallyExpanded: true, // <-- buka di awal
                              expandedAlignment: Alignment.centerLeft,
                              children: [
                                Wrap(
                                  spacing: 8,
                                  children:
                                      (detail['antonyms'] as List<dynamic>? ??
                                              [])
                                          .map(
                                            (a) => Chip(
                                              label: Text(
                                                a,
                                                style: body.copyWith(
                                                  color: ColorPallete.accent,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              backgroundColor: Colors.white,
                                              padding: EdgeInsets.zero,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                side: BorderSide(
                                                  color: ColorPallete.accent,
                                                  width: 1.5,
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              tilePadding: EdgeInsets.zero,
                              childrenPadding: EdgeInsets.zero,
                              title: Text(
                                'Definition',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorPallete.accent,
                                ),
                              ),
                              iconColor: ColorPallete.accent,
                              visualDensity: VisualDensity.compact,
                              minTileHeight: 0,
                              shape: const RoundedRectangleBorder(),
                              collapsedShape: const RoundedRectangleBorder(),
                              initiallyExpanded: true,
                              expandedAlignment: Alignment.centerLeft,
                              children: [
                                Divider(color: ColorPallete.background),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 8,
                                    bottom: 8,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: ColorPallete.accent,
                                        child: Text(
                                          '1',
                                          style: caption.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              "(${word.type}) ",
                                                          style: body.copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                ColorPallete
                                                                    .accent,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              detail['definition'] ??
                                                              '',
                                                          style: body.copyWith(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 16),
                                            _ExampleAccordion(
                                              example: detail['example'] ?? '',
                                              highlightWord: word.text,
                                            ),
                                            const SizedBox(height: 8),
                                            _SynonymAccordion(
                                              synonyms:
                                                  (detail['synonyms']
                                                              as List<
                                                                dynamic
                                                              >? ??
                                                          [])
                                                      .cast<String>(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showSuggest =
        _searchHistory.isNotEmpty && _controller.text.isNotEmpty;
    final isQueryEmpty = _controller.text.isEmpty;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: kToolbarHeight),
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
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),
                  Expanded(child: _SearchInput(controller: _controller)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            if (isQueryEmpty)
              Expanded(
                child: _SearchResultList(
                  words: _filteredWords,
                  onWordTap: (word) {
                    _addToHistory(word.text);
                    _showWordDetail(context, word);
                  },
                ),
              )
            else ...[
              Expanded(
                child: ListView(
                  children: [
                    _SearchResultList(
                      words: _filteredWords.take(3).toList(),
                      onWordTap: (word) {
                        _addToHistory(word.text);
                        _showWordDetail(context, word);
                      },
                    ),
                    if (showSuggest) ...[
                      _SearchDivider(),
                      _SearchResultList(
                        words:
                            _searchHistory.map((text) {
                              final found = _allWords.firstWhere(
                                (w) => w.text == text,
                                orElse: () => Word(text, ''),
                              );
                              return found;
                            }).toList(),
                        onWordTap: (word) {
                          _controller.text = word.text;
                          _onSearchChanged();
                          _showWordDetail(context, word);
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _SearchInput extends StatelessWidget {
  final TextEditingController controller;
  const _SearchInput({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: body,
      decoration: InputDecoration(
        hintText: 'Search...',
        prefixIcon: Icon(Icons.search, color: ColorPallete.disabled),
        suffixIcon:
            controller.text.isNotEmpty
                ? IconButton(
                  icon: Icon(Icons.close, color: Colors.grey),
                  onPressed: () {
                    controller.clear();
                    FocusScope.of(context).unfocus();
                  },
                )
                : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorPallete.disabled),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorPallete.disabled),
        ),
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
      ),
    );
  }
}

class _SearchDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
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
  final List<Word> words;
  final ValueChanged<Word>? onWordTap;
  const _SearchResultList({required this.words, this.onWordTap});

  @override
  Widget build(BuildContext context) {
    if (words.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
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
            const SizedBox(height: 42),
          ],
        ),
      );
    }
    return ListView.separated(
      itemCount: words.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      shrinkWrap: true,
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
  final Word word;
  final VoidCallback? onTap;
  const _SearchWordTile({required this.word, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(word.text, style: body),
      subtitle:
          word.type.isNotEmpty
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

class _ExampleAccordion extends StatefulWidget {
  final String example;
  final String highlightWord;
  const _ExampleAccordion({required this.example, required this.highlightWord});

  @override
  State<_ExampleAccordion> createState() => _ExampleAccordionState();
}

class _ExampleAccordionState extends State<_ExampleAccordion> {
  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    // Regex untuk highlight kata (case-insensitive, whole word)
    final regExp = RegExp(
      r'\b' + RegExp.escape(widget.highlightWord) + r'\b',
      caseSensitive: false,
    );
    final matches = regExp.allMatches(widget.example);

    List<TextSpan> spans = [];
    int last = 0;
    for (final match in matches) {
      if (match.start > last) {
        spans.add(
          TextSpan(
            text: widget.example.substring(last, match.start),
            style: body.copyWith(color: Colors.black),
          ),
        );
      }
      spans.add(
        TextSpan(
          text: widget.example.substring(match.start, match.end),
          style: body.copyWith(color: ColorPallete.danger),
        ),
      );
      last = match.end;
    }
    if (last < widget.example.length) {
      spans.add(
        TextSpan(
          text: widget.example.substring(last),
          style: body.copyWith(color: Colors.black),
        ),
      );
    }

    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => setState(() => _expanded = !_expanded),
          child: Row(
            children: [
              AnimatedRotation(
                turns: _expanded ? 0.5 : 0,
                duration: const Duration(milliseconds: 200),
                child: const Icon(
                  Icons.expand_more,
                  color: ColorPallete.accent,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Example',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorPallete.accent,
                ),
              ),
            ],
          ),
        ),
        if (_expanded)
          Padding(
            padding: const EdgeInsets.only(left: 32, top: 8, bottom: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: RichText(text: TextSpan(children: spans)),
            ),
          ),
      ],
    );
  }
}

class _SynonymAccordion extends StatefulWidget {
  final List<String> synonyms;
  const _SynonymAccordion({required this.synonyms});

  @override
  State<_SynonymAccordion> createState() => _SynonymAccordionState();
}

class _SynonymAccordionState extends State<_SynonymAccordion> {
  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => setState(() => _expanded = !_expanded),
          child: Row(
            children: [
              AnimatedRotation(
                turns: _expanded ? 0.5 : 0,
                duration: const Duration(milliseconds: 200),
                child: const Icon(
                  Icons.expand_more,
                  color: ColorPallete.accent,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Synonym',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorPallete.accent,
                ),
              ),
            ],
          ),
        ),
        if (_expanded)
          Padding(
            padding: const EdgeInsets.only(left: 32, top: 8, bottom: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: 8,
                children:
                    widget.synonyms
                        .map(
                          (s) => Chip(
                            label: Text(
                              s,
                              style: body.copyWith(
                                color: ColorPallete.accent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: ColorPallete.accent,
                                width: 1.5,
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
      ],
    );
  }
}
