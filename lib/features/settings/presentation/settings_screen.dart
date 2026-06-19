import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/injection/service_locator.dart';
import 'package:learning_language_app/const/typography.dart';
import 'package:learning_language_app/const/utils/shared_preferences.dart';
import 'package:learning_language_app/features/login/domain/usecases/logout_usecase.dart';
import 'package:learning_language_app/features/settings/data/data_sources/settings_data_source.dart';
import 'package:learning_language_app/router/navigation_extensions.dart';
import 'package:learning_language_app/router/path.dart';
import 'package:learning_language_app/widgets/button/fill_button_widget.dart';
import 'package:learning_language_app/widgets/flashcard_style_scaffold.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _settings = sl<SettingsDataSource>();
  final _logout = sl<LogoutUsecase>();

  bool _dailyReminderEnabled = true;
  bool _notificationsEnabled = true;
  bool _isLoading = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    try {
      final settings = await _settings.getSettings();
      if (!mounted) return;
      setState(() {
        _dailyReminderEnabled = settings.dailyReminderEnabled;
        _notificationsEnabled = settings.notificationsEnabled;
        _isLoading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _isLoading = false);
    }
  }

  Future<void> _patchSetting(String key, bool value, void Function(bool) revert) async {
    setState(() => _isSaving = true);
    try {
      await _settings.updateSettings({key: value});
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update settings: $e')),
      );
      setState(() => revert(!value));
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  Future<void> _toggleDailyReminder(bool value) async {
    setState(() => _dailyReminderEnabled = value);
    await _patchSetting('daily_reminder_enabled', value, (v) {
      _dailyReminderEnabled = v;
    });
  }

  Future<void> _toggleNotifications(bool value) async {
    setState(() => _notificationsEnabled = value);
    await _patchSetting('notifications_enabled', value, (v) {
      _notificationsEnabled = v;
    });
  }

  Future<void> _logoutUser(BuildContext context) async {
    final result = await _logout.call();
    result.fold(
      (_) async {
        await sl<SharedPref>().saveUserLogout();
        if (context.mounted) context.go(Paths.login);
      },
      (error) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Logout failed: $error')),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final email = sl<SharedPref>().getEmail ?? 'Not signed in';

    return FlashcardStyleScaffold.page(
      title: 'Settings',
      onBack: () => context.popOrGo(Paths.home),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
        child: Container(
          decoration: flashcardStylePanelDecoration(),
          child: _isLoading
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(32),
                    child: CircularProgressIndicator(),
                  ),
                )
              : ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: [
                    ListTile(
                      leading: const Icon(Icons.email_outlined),
                      title: const Text('Account'),
                      subtitle: Text(email, style: caption),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    SwitchListTile(
                      secondary: const Icon(Icons.notifications_outlined),
                      title: const Text('Daily reminder'),
                      subtitle: const Text('Get notified to practice'),
                      value: _dailyReminderEnabled,
                      onChanged: _isSaving ? null : _toggleDailyReminder,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    SwitchListTile(
                      secondary: const Icon(Icons.campaign_outlined),
                      title: const Text('Notifications'),
                      subtitle: const Text('App notifications'),
                      value: _notificationsEnabled,
                      onChanged: _isSaving ? null : _toggleNotifications,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    ListTile(
                      leading: const Icon(Icons.history),
                      title: const Text('Points history'),
                      subtitle: const Text('View your point transactions'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => context.push(Paths.pointsHistory),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.info_outline),
                      title: const Text('App version'),
                      subtitle: Text('1.0.0', style: caption),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: FillButtonWidget(
                        label: 'Logout',
                        textStyle: const TextStyle(color: Colors.white),
                        backgroundColor: ColorPallete.danger,
                        onPressed: () => _logoutUser(context),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
