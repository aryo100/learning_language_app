import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/injection/service_locator.dart';
import 'package:learning_language_app/const/typography.dart';
import 'package:learning_language_app/features/home/bloc/profile/profile_bloc.dart';
import 'package:learning_language_app/features/word_store/bloc/word/word_bloc.dart';
import 'package:learning_language_app/router/navigation_extensions.dart';
import 'package:learning_language_app/router/path.dart';
import 'package:learning_language_app/widgets/button/fill_button_widget.dart';

class WordStoreScreen extends StatelessWidget {
  const WordStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
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
                  BlocConsumer<ProfileBloc, ProfileState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      final point = state.profile?.point ?? 0;
                      return SizedBox(
                        height: 200,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    onPressed: () =>
                                        context.popOrGo(Paths.home),
                                    icon: const Icon(
                                      Icons.home_rounded,
                                      size: 28,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 11,
                                      right: 11,
                                    ),
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      alignment: Alignment.centerLeft,
                                      child: point > 0
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Text(
                                                  'You got',
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  '$point',
                                                  style: const TextStyle(
                                                    fontSize: 36,
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorPallete.warning,
                                                  ),
                                                ),
                                                const Text(
                                                  ' points',
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Text(
                                                  'Let\'s earn points!',
                                                  style: TextStyle(
                                                    fontSize: 28,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  'Join the fun & collect rewards',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorPallete.warning,
                                                  ),
                                                ),
                                              ],
                                            ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                    child: Row(
                                      children: [
                                        Stack(
                                          alignment: Alignment.center,
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
                                        const SizedBox(width: 4),
                                        const Text(
                                          'x16',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: point > 0 ? 3 : 2,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Image.asset(
                                  'assets/images/banner_word_store.png',
                                  fit: BoxFit.contain,
                                  alignment: Alignment.bottomRight,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () =>
                          GoRouter.of(context).push(Paths.searchPage),
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                BlocBuilder<WordBloc, WordState>(
                                  builder: (context, state) {
                                    final totalWord = state.maybeWhen(
                                      success: (words, total) => total,
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
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(
                                            Icons.storefront_outlined,
                                            color: Colors.white,
                                            size: 18,
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
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_forward,
                                  color: ColorPallete.accent,
                                  size: 32,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Word Store',
                              style: body.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: ColorPallete.primary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Your personal collection of words. Add new words and review them anytime!',
                              style: caption.copyWith(
                                color: ColorPallete.disabled,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
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
                          Text(
                            'Activities',
                            style: body.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: ColorPallete.primary,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _ActivityRow(
                            icon: SvgPicture.asset('assets/svg/quiz_icon.svg'),
                            title: 'Quiz',
                            buttonLabel: 'Play',
                            onPressed: () =>
                                GoRouter.of(context).push(Paths.quiz),
                          ),
                          const SizedBox(height: 12),
                          _ActivityRow(
                            icon: SvgPicture.asset(
                              'assets/svg/puzzle_icon.svg',
                            ),
                            title: 'Sliding Puzzle',
                            buttonLabel: 'Play',
                            onPressed: () =>
                                GoRouter.of(context).push(Paths.puzzle),
                          ),
                          const SizedBox(height: 12),
                          _ActivityRow(
                            icon: const Icon(
                              Icons.style,
                              size: 42,
                              color: ColorPallete.accent,
                            ),
                            title: 'Flashcard',
                            buttonLabel: 'Start',
                            onPressed: () =>
                                GoRouter.of(context).push(Paths.flashcard),
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

class _ActivityRow extends StatelessWidget {
  const _ActivityRow({
    required this.icon,
    required this.title,
    required this.buttonLabel,
    required this.onPressed,
  });

  final Widget icon;
  final String title;
  final String buttonLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorPallete.background,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              SizedBox(height: 42, width: 42, child: icon),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: body.copyWith(
                    color: ColorPallete.accent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              FillButtonWidget(
                label: buttonLabel,
                textStyle: const TextStyle(color: Colors.white, fontSize: 14),
                backgroundColor: ColorPallete.danger,
                onPressed: onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
