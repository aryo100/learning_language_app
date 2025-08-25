import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/injection/service_locator.dart';
import 'package:learning_language_app/const/typography.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_language_app/features/home/bloc/profile/profile_bloc.dart';
import 'package:learning_language_app/features/word_store/bloc/word/word_bloc.dart';
import 'package:learning_language_app/router/path.dart';
import 'package:learning_language_app/widgets/button/fill_button_widget.dart';

class WordStoreScreen extends StatelessWidget {
  const WordStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  sl<ProfileBloc>()..add(const ProfileEvent.getProfile()),
        ),
        BlocProvider(
          create: (context) => sl<WordBloc>()..add(const WordEvent.getWord()),
        ),
      ],
      child: Scaffold(
        backgroundColor: ColorPallete.accent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  // Title & Image
                  IntrinsicHeight(
                    child: BlocConsumer<ProfileBloc, ProfileState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        final point = state.profile?.point ?? 0;
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      IconButton(
                                        onPressed:
                                            () => Navigator.of(context).pop(),
                                        icon: Icon(
                                          Icons.home_rounded,
                                          size: 28,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        point > 0
                                            ? EdgeInsets.zero
                                            : EdgeInsets.only(
                                              left: 11,
                                              bottom: 22,
                                              right: 11,
                                            ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children:
                                          point > 0
                                              ? [
                                                Text(
                                                  'You got',
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  '$point',
                                                  style: TextStyle(
                                                    fontSize: 36,
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorPallete.warning,
                                                  ),
                                                ),
                                                Text(
                                                  ' points',
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ]
                                              : [
                                                Text(
                                                  'Let\'s earn points!',
                                                  style: TextStyle(
                                                    fontSize: 32,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  'Join the fun & collect rewards',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorPallete.warning,
                                                  ),
                                                ),
                                              ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            size: 24,
                                            color: ColorPallete.warning,
                                          ),
                                          Icon(
                                            Icons.paid_outlined,
                                            size: 24,
                                            color: Colors.yellow,
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        "x16",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: point > 0 ? 3 : 1,
                              child: Image.asset(
                                'assets/images/banner_word_store.png',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Word Store Card
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BlocConsumer<WordBloc, WordState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  final totalWord = state.maybeWhen(
                                    success: (words) => words.length,
                                    orElse: () => 0,
                                  );
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color.lerp(
                                        ColorPallete.accent,
                                        Colors.white,
                                        0.2,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.storefront_outlined,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '$totalWord words',
                                          style: caption.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                onPressed: () {
                                  GoRouter.of(context).push(Paths.searchPage);
                                },
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: ColorPallete.accent,
                                  size: 32,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Word Store',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: ColorPallete.primary,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Your personal collection of words. Add new words and review them anytime!',
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorPallete.disabled,
                            ),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Activities Card
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Activities',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: ColorPallete.primary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorPallete.background,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 16,
                                ),
                                alignment: Alignment.centerLeft,
                              ),
                              icon: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: SizedBox(
                                  height: 42,
                                  width: 42,
                                  child: SvgPicture.asset(
                                    'assets/svg/quiz_icon.svg',
                                  ),
                                ),
                              ),
                              label: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Quiz',
                                    style: TextStyle(
                                      color: ColorPallete.accent,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  FillButtonWidget(
                                    label: "Play",
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                    backgroundColor: ColorPallete.danger,
                                    onPressed: () {
                                      GoRouter.of(context).push(Paths.quiz);
                                    },
                                  ),
                                ],
                              ),
                              onPressed: () {
                                // TODO: Navigasi ke quiz
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorPallete.background,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 16,
                                ),
                                alignment: Alignment.centerLeft,
                              ),
                              icon: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: SizedBox(
                                  height: 42,
                                  width: 42,
                                  child: SvgPicture.asset(
                                    'assets/svg/puzzle_icon.svg',
                                  ),
                                ),
                              ),
                              label: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Sliding Puzzle',
                                    style: TextStyle(
                                      color: ColorPallete.accent,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  FillButtonWidget(
                                    label: "Play",
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                    backgroundColor: ColorPallete.danger,
                                    onPressed: () {
                                      GoRouter.of(context).push(Paths.puzzle);
                                    },
                                  ),
                                ],
                              ),
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorPallete.background,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 16,
                                ),
                                alignment: Alignment.centerLeft,
                              ),
                              icon: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: SizedBox(
                                  height: 42,
                                  width: 42,
                                  child: Icon(
                                    Icons.style,
                                    size: 42,
                                    color: ColorPallete.accent,
                                  ),
                                ),
                              ),
                              label: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Flashcard',
                                    style: TextStyle(
                                      color: ColorPallete.accent,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  FillButtonWidget(
                                    label: "Start",
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                    backgroundColor: ColorPallete.danger,
                                    onPressed: () {
                                      GoRouter.of(
                                        context,
                                      ).push(Paths.flashcard);
                                    },
                                  ),
                                ],
                              ),
                              onPressed: () {
                                GoRouter.of(context).push(Paths.flashcard);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
