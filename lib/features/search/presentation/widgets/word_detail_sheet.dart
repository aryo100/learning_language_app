import 'package:flutter/material.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/injection/service_locator.dart';
import 'package:learning_language_app/const/typography.dart';
import 'package:learning_language_app/features/word_store/domain/entities/word_entity.dart';
import 'package:learning_language_app/features/word_store/domain/usecases/get_word_by_word_usecase.dart';

Future<void> showWordDetailSheet(
  BuildContext context,
  WordEntity word,
) async {
  WordEntity detail = word;
  if (word.synonyms.isEmpty &&
      word.antonyms.isEmpty &&
      word.definition.isEmpty) {
    final result = await sl<GetWordByWordUsecase>().call(word.word);
    result.fold((entity) => detail = entity, (_) {});
  }
  if (!context.mounted) return;

  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) => SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: SingleChildScrollView(
            child: WordDetailContent(detail: detail),
          ),
        ),
      ),
    ),
  );
}

class WordDetailContent extends StatelessWidget {
  const WordDetailContent({super.key, required this.detail});

  final WordEntity detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              detail.word,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.content_copy_rounded,
              color: ColorPallete.disabled,
              size: 20,
            ),
          ],
        ),
        Text('(${detail.type})', style: caption),
        const SizedBox(height: 8),
        const Divider(color: ColorPallete.background),
        if (detail.synonyms.isNotEmpty)
          ExpansionTile(
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.zero,
            title: Text(
              'Synonyms',
              style: body.copyWith(
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
                children: detail.synonyms
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
                          side: const BorderSide(
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
        if (detail.antonyms.isNotEmpty)
          ExpansionTile(
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.zero,
            title: Text(
              'Antonyms',
              style: body.copyWith(
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
                children: detail.antonyms
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
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(
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
        if (detail.definition.isNotEmpty)
          ExpansionTile(
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.zero,
            title: Text(
              'Definition',
              style: body.copyWith(
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
              const Divider(color: ColorPallete.background),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '(${detail.type}) ',
                                  style: body.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: ColorPallete.accent,
                                  ),
                                ),
                                TextSpan(
                                  text: detail.definition,
                                  style: body.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (detail.example.isNotEmpty) ...[
                            const SizedBox(height: 16),
                            _ExampleAccordion(
                              example: detail.example,
                              highlightWord: detail.word,
                            ),
                          ],
                          if (detail.synonyms.isNotEmpty) ...[
                            const SizedBox(height: 8),
                            _SynonymAccordion(synonyms: detail.synonyms),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ],
          ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class _ExampleAccordion extends StatefulWidget {
  const _ExampleAccordion({
    required this.example,
    required this.highlightWord,
  });

  final String example;
  final String highlightWord;

  @override
  State<_ExampleAccordion> createState() => _ExampleAccordionState();
}

class _ExampleAccordionState extends State<_ExampleAccordion> {
  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    final regExp = RegExp(
      r'\b' + RegExp.escape(widget.highlightWord) + r'\b',
      caseSensitive: false,
    );
    final matches = regExp.allMatches(widget.example);

    final spans = <TextSpan>[];
    var last = 0;
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
                style: body.copyWith(
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
  const _SynonymAccordion({required this.synonyms});

  final List<String> synonyms;

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
                style: body.copyWith(
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
                children: widget.synonyms
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
                          side: const BorderSide(
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
