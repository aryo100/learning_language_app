import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/injection/service_locator.dart';
import 'package:learning_language_app/const/typography.dart';
import 'package:learning_language_app/features/search/presentation/widgets/word_detail_sheet.dart';
import 'package:learning_language_app/features/word_store/bloc/cart_word/cart_word_bloc.dart';
import 'package:learning_language_app/features/word_store/domain/entities/word_entity.dart';
import 'package:learning_language_app/router/navigation_extensions.dart';
import 'package:learning_language_app/router/path.dart';
import 'package:learning_language_app/widgets/button/fill_button_widget.dart';
import 'package:learning_language_app/widgets/flashcard_style_scaffold.dart';
import 'package:learning_language_app/widgets/flashcard_style_word_list_panel.dart';

class WordBagScreen extends StatelessWidget {
  const WordBagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CartWordBloc>()..add(const CartWordEvent.getCartWord()),
      child: FlashcardStyleScaffold.page(
        title: 'My Word Bag',
        onBack: () => context.popOrGo(Paths.home),
        child: BlocBuilder<CartWordBloc, CartWordState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              failure: (msg) => Center(
                child: Text(
                  msg,
                  style: body.copyWith(color: ColorPallete.disabled),
                  textAlign: TextAlign.center,
                ),
              ),
              success: (words) => _WordBagBody(words: words),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}

class _WordBagBody extends StatelessWidget {
  const _WordBagBody({required this.words});

  final List<WordEntity> words;

  @override
  Widget build(BuildContext context) {
    if (words.isEmpty) {
      return FlashcardStyleEmptyPanel(
        icon: Icons.shopping_basket_outlined,
        message: 'Your bag is empty',
        child: Column(
          children: [
            Text(
              'Add words from Word Store or flashcards',
              style: caption,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FillButtonWidget(
              label: 'Browse Word Store',
              textStyle: const TextStyle(color: Colors.white),
              backgroundColor: ColorPallete.accent,
              onPressed: () => context.push(Paths.wordStore),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
      child: FlashcardStyleWordListPanel(
        countLabel: '${words.length} words',
        countIcon: Icons.shopping_basket_outlined,
        subtitle: 'Saved words',
        hint: 'Swipe left to remove a word from your bag',
        words: words,
        itemBuilder: (context, word) => Dismissible(
          key: ValueKey(word.id),
          direction: DismissDirection.endToStart,
          onDismissed: (_) {
            context.read<CartWordBloc>().add(
              CartWordEvent.removeCartWord(word.id),
            );
          },
          background: Container(
            color: ColorPallete.danger,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          child: ListTile(
            title: Text(word.word, style: body),
            subtitle: word.type.isNotEmpty
                ? Text(word.type, style: caption)
                : null,
            trailing: const Icon(
              Icons.content_copy_rounded,
              color: ColorPallete.disabled,
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
