import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/injection/service_locator.dart';
import 'package:learning_language_app/const/typography.dart';
import 'package:learning_language_app/features/home/bloc/profile/profile_bloc.dart';
import 'package:learning_language_app/features/home/bloc/summary/summary_bloc.dart';
import 'package:learning_language_app/features/word_store/bloc/cart_word/cart_word_bloc.dart';
import 'package:learning_language_app/router/path.dart';
import 'package:learning_language_app/widgets/button/fill_button_widget.dart';
import 'package:learning_language_app/widgets/button/text_button_widget.dart';
import 'package:learning_language_app/widgets/textfield/single_textfield_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int weeklyCheckIn = 3;
  int monthlyCheckIn = 7;
  String todayWord = "mono";
  late String avatar = '';

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ProfileBloc profileBloc, ImageSource source) async {
    final XFile? image = await _picker
        .pickImage(source: source)
        .onError((error, stackTrace) => null);
    if (image != null) {
      var file = await dio.MultipartFile.fromFile(image.path);
      profileBloc.add(ProfileEvent.uploadImage(file));
    }
  }

  void _showProfileModal(BuildContext blocContext) {
    final profileBloc = BlocProvider.of<ProfileBloc>(blocContext);
    final profile = profileBloc.state.maybeWhen(
      (profile, uploadImagePath, errorMessage, isLoading) => profile,
      orElse: () => null,
    );
    final initialName = profile?.name ?? '';
    final initialAvatar = profile?.photoUrl ?? '';

    String? tempName = initialName;
    String? tempAvatar = initialAvatar;

    showModalBottomSheet<Map<String, String?>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (modalContext) {
        return BlocProvider.value(
          value: profileBloc,
          child: StatefulBuilder(
            builder: (context, setModalState) {
              return BlocConsumer<ProfileBloc, ProfileState>(
                listener: (context, state) {
                  state.maybeWhen((
                    profile,
                    uploadImagePath,
                    errorMessage,
                    isLoading,
                  ) {
                    if (uploadImagePath != null) {
                      setModalState(() {
                        tempAvatar = uploadImagePath;
                      });
                    }
                  }, orElse: () {});
                },
                builder: (context, state) {
                  return SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 24,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Avatar & Edit
                          GestureDetector(
                            onTap: () => _showImagePickerOptions(profileBloc),
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                (tempAvatar?.isEmpty ?? true)
                                    ? CircleAvatar(
                                      radius: 40,
                                      backgroundColor: ColorPallete.accent,
                                      child: const Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 48,
                                      ),
                                    )
                                    : CircleAvatar(
                                      radius: 40,
                                      foregroundImage: NetworkImage(
                                        tempAvatar ?? '',
                                      ),
                                      backgroundColor: ColorPallete.accent,
                                    ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.white,
                                    child: const Icon(
                                      Icons.camera_alt,
                                      color: ColorPallete.primary,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Name & Edit
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                tempName ?? '',
                                style: body.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorPallete.primary,
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  final result = await showDialog<String>(
                                    context: context,
                                    builder:
                                        (context) => Dialog(
                                          backgroundColor: Colors.transparent,
                                          child: _ProfileEditNameModal(
                                            initialName: tempName ?? '',
                                          ),
                                        ),
                                  );
                                  if (result != null && result.isNotEmpty) {
                                    setModalState(() {
                                      tempName = result;
                                    });
                                  }
                                },
                                child: const Icon(
                                  Icons.edit,
                                  color: ColorPallete.primary,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                          // Email
                          Text(
                            profile?.email ?? 'xxx@xxx.com',
                            style: caption.copyWith(
                              color: ColorPallete.disabled,
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Point
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: ColorPallete.danger,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '${profile?.point ?? 0} Points',
                              style: caption.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 18),
                          // Action Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  // TODO: Implement favorite list
                                },
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: ColorPallete.accent,
                                  size: 28,
                                ),
                                tooltip: 'Favorite',
                              ),
                              IconButton(
                                onPressed: () {
                                  // TODO: Implement cart
                                },
                                icon: const Icon(
                                  Icons.shopping_basket_outlined,
                                  color: ColorPallete.accent,
                                  size: 28,
                                ),
                                tooltip: 'Cart',
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    ).then((_) async {
      final changed =
          (tempName != initialName) || (tempAvatar != initialAvatar);
      if (changed) {
        final confirm = await showDialog<bool>(
          builder:
              (context) => AlertDialog(
                backgroundColor: Colors.transparent,
                contentPadding: EdgeInsets.zero,
                content: Container(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 24,
                    bottom: 24,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Confirmation',
                        style: body.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Save profile changes?',
                        style: body.copyWith(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButtonWidget(
                            label: "Cancel",
                            textStyle: const TextStyle(
                              color: ColorPallete.primary,
                              fontSize: 14,
                            ),
                            onPressed: () => Navigator.pop(context, false),
                          ),
                          FillButtonWidget(
                            label: "Save",
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            backgroundColor: ColorPallete.accent,
                            onPressed: () => Navigator.pop(context, true),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          context: context,
        );
        if (confirm == true && profile != null) {
          profileBloc.add(
            ProfileEvent.updateProfile(
              profile.copyWith(
                name: tempName ?? profile.name,
                photoUrl: tempAvatar ?? profile.photoUrl,
              ),
            ),
          );
        }
      }
    });
  }

  void _showImagePickerOptions(ProfileBloc profileBloc) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a photo'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(profileBloc, ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Select from gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(profileBloc, ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileBloc>(
          create: (_) => sl<ProfileBloc>()..add(ProfileEvent.getProfile()),
        ),
        BlocProvider(
          create:
              (context) =>
                  sl<SummaryBloc>()
                    ..add(SummaryEvent.getCheckInSummary())
                    ..add(SummaryEvent.getNewWord())
                    ..add(SummaryEvent.getLeaderboard()),
        ),
        BlocProvider<CartWordBloc>(
          create: (_) => sl<CartWordBloc>()..add(CartWordEvent.getCartWord()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // profile
                BlocConsumer<ProfileBloc, ProfileState>(
                  listener: (context, state) {
                    state.when((
                      profile,
                      uploadImagePath,
                      errorMessage,
                      isLoading,
                    ) {
                      if (errorMessage != null && errorMessage.isNotEmpty) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(errorMessage)));
                        return;
                      }
                      setState(() {
                        avatar = uploadImagePath ?? profile?.photoUrl ?? '';
                      });
                    });
                  },
                  builder: (context, state) {
                    final profile = state.maybeWhen(
                      (profile, uploadImagePath, errorMessage, isLoading) =>
                          profile,
                      orElse: () => null,
                    );
                    return GestureDetector(
                      onTap: () => _showProfileModal(context),
                      child: Row(
                        children: [
                          (profile?.photoUrl.isEmpty ?? true)
                              ? CircleAvatar(
                                radius: 20,
                                backgroundColor: ColorPallete.accent,
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                              )
                              : CircleAvatar(
                                foregroundImage: NetworkImage(
                                  profile?.photoUrl ?? '',
                                ),
                                backgroundColor: ColorPallete.accent,
                              ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi, ${profile?.name ?? ''}!',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorPallete.danger,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  '${profile?.point ?? 0} Points',
                                  style: caption.copyWith(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                BlocConsumer<CartWordBloc, CartWordState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    final totalCartWords = state.maybeWhen(
                      success: (cartWords) => cartWords.length,
                      orElse: () => 0,
                    );
                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.local_mall_outlined,
                            color: ColorPallete.accent,
                            size: 32,
                          ),
                          tooltip: 'Order',
                          onPressed: () {
                            context.push(Paths.wordStore);
                          },
                        ),
                        if (totalCartWords > 0)
                          Positioned(
                            right: 2,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '$totalCartWords',
                                style: caption.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          actions: [],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              // Ganti ListView dengan Column
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SectionCard(
                  title: 'General',
                  cardColor: ColorPallete.accent,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: BlocConsumer<SummaryBloc, SummaryState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        final checkInSummary = state.checkInSummary;
                        final lastCheckInDate =
                            checkInSummary?.lastCheckInDate ?? DateTime.now();
                        final checkInDate =
                            '${(lastCheckInDate).day}/${(lastCheckInDate).month}/${(lastCheckInDate).year}';
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              color: Color.lerp(
                                ColorPallete.accent,
                                Colors.white,
                                0.2,
                              ),
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.assignment_turned_in_outlined,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Check-in',
                                          style: caption.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Card(
                                      color: ColorPallete.accent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      elevation: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.view_list_outlined,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(width: 12),
                                            Text(
                                              checkInDate,
                                              style: caption.copyWith(
                                                color: Colors.white,
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
                            const SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Color.lerp(
                                          ColorPallete.accent,
                                          Colors.white,
                                          0.2,
                                        ),
                                        child: const Icon(
                                          Icons.event_available,
                                          size: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${checkInSummary?.totalCheckInsPerWeek ?? 0} times',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            'This week',
                                            style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.white,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Color.lerp(
                                          ColorPallete.accent,
                                          Colors.white,
                                          0.2,
                                        ),
                                        child: const Icon(
                                          Icons.bolt,
                                          size: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${checkInSummary?.totalCheckInsPerMonth ?? 0} times',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            'This month',
                                            style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.white,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 8),
                _SectionCard(
                  title: 'Every Day a New Word',
                  cardColor: null,
                  cardGradient: LinearGradient(
                    colors: [ColorPallete.primary, Colors.black87],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: BlocConsumer<SummaryBloc, SummaryState>(
                      listener: (context, state) {
                        print('errorMessage: ${state.errorMessage}');
                        print('vocab: ${state.vocab}');
                      },
                      builder: (context, state) {
                        final vocab = state.vocab;

                        return Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          vocab?.word ?? '',
                                          style: subtitle.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '(${vocab?.type ?? ''})',
                                          style: caption.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          vocab?.definition ?? '',
                                          style: caption.copyWith(
                                            color: Colors.white,
                                          ),
                                          softWrap: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    context.read<SummaryBloc>().add(
                                      SummaryEvent.getNewWord(),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.refresh,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(child: SizedBox(width: 100)),
                                Flexible(
                                  child: FillButtonWidget(
                                    onPressed: () {},
                                    label: "Learn More",
                                    textStyle: caption.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 8),
                _SectionCard(
                  title: 'Leaderboard',
                  cardColor: Colors.white,
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: ColorPallete.background,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TabBar(
                            labelColor: ColorPallete.primary,
                            unselectedLabelColor: ColorPallete.disabled,
                            indicator: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            indicatorSize: TabBarIndicatorSize.tab,
                            dividerHeight: 0,
                            labelStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            padding: const EdgeInsets.all(6),
                            labelPadding:
                                EdgeInsets.zero, // Hilangkan padding antar tab
                            tabs: const [
                              Tab(child: Text('Points')),
                              Tab(child: Text('Attendances')),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 300,
                          child: BlocConsumer<SummaryBloc, SummaryState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              final leaderboard = state.leaderboard;

                              if (leaderboard == null) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              final pointsUsers = leaderboard['points'] ?? [];
                              final attendanceUsers =
                                  leaderboard['attendance'] ?? [];

                              return TabBarView(
                                children: [
                                  // Points Tab
                                  _LeaderboardList(
                                    users:
                                        pointsUsers
                                            .map(
                                              (user) => LeaderboardUser(
                                                name: user.name,
                                                achievement: user.achievement,
                                              ),
                                            )
                                            .toList(),
                                    emptyText: 'No users with points yet.',
                                    icon: Icons.emoji_events_outlined,
                                  ),
                                  // Attendances Tab
                                  _LeaderboardList(
                                    users:
                                        attendanceUsers
                                            .map(
                                              (user) => LeaderboardUser(
                                                name: user.name,
                                                achievement: user.achievement,
                                              ),
                                            )
                                            .toList(),
                                    icon: Icons.leaderboard_outlined,
                                    emptyText: 'No attendance records yet.',
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;
  final Color? cardColor;
  final Gradient? cardGradient;

  const _SectionCard({
    required this.title,
    required this.child,
    this.cardColor,
    this.cardGradient,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 12),
          child: Text(title, style: body.copyWith(fontWeight: FontWeight.bold)),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 18),
          decoration: BoxDecoration(
            color: cardGradient == null ? cardColor : null,
            gradient: cardGradient,
            borderRadius: BorderRadius.circular(10),
          ),
          child: child,
        ),
      ],
    );
  }
}

// Leaderboard List Widget
class LeaderboardUser {
  final String name;
  final String achievement;
  LeaderboardUser({required this.name, required this.achievement});
}

class _LeaderboardList extends StatelessWidget {
  final List<LeaderboardUser> users;
  final String emptyText;
  final IconData icon;

  const _LeaderboardList({
    required this.users,
    required this.emptyText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.grey, size: 48),
              const SizedBox(height: 12),
              Text(
                emptyText,
                style: caption.copyWith(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: users.length,
      separatorBuilder: (_, __) => Divider(height: 1),
      itemBuilder: (context, index) {
        final user = users[index];

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: ColorPallete.primary,
                        child: Text(
                          '${index + 1}',
                          style: caption.copyWith(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        user.name,
                        style: body.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    user.achievement,
                    style: caption.copyWith(color: ColorPallete.primary),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ProfileEditNameModal extends StatelessWidget {
  final String initialName;
  const _ProfileEditNameModal({required this.initialName});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: initialName);

    return Container(
      padding: EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 24,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Edit Name',
            style: body.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 16),
          SingleTextFieldWidget(controller: controller, obscureText: false),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButtonWidget(
                label: "Back",
                textStyle: const TextStyle(
                  color: ColorPallete.primary,
                  fontSize: 14,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              FillButtonWidget(
                label: "Next",
                textStyle: const TextStyle(color: Colors.white, fontSize: 14),
                backgroundColor: ColorPallete.accent,
                onPressed: () => Navigator.pop(context, controller.text),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
