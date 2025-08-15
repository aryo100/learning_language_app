import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_language_app/const/injection/service_locator.dart';
import 'package:learning_language_app/const/utils/shared_preferences.dart';

import 'package:learning_language_app/router/path.dart';
import 'package:learning_language_app/widgets/button/fill_button_widget.dart';

import '../bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => sl<LoginBloc>(),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo-lang.png', height: 100),
                const SizedBox(height: 32),
                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      success: (email) async {
                        await sl<SharedPref>().saveEmail(email);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Login Google berhasil: $email'),
                          ),
                        );
                        await sl<SharedPref>().saveUserLogin();
                        GoRouter.of(context).go(Paths.home);
                      },
                      failure: (message) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Login Google gagal: $message'),
                          ),
                        );
                      },
                    );
                  },
                  builder: (context, state) {
                    return FillButtonWidget(
                      label: state.maybeWhen(
                        loading: () => '',
                        orElse: () => 'Login with Google',
                      ),
                      prefixIcon: state.maybeWhen(
                        loading:
                            () => const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                        orElse:
                            () => Image.asset(
                              'assets/images/google-logo.png',
                              height: 24,
                            ),
                      ),
                      isDisabled: state.maybeWhen(
                        orElse: () => false,
                        loading: () => true,
                      ),
                      onPressed:
                          () => context.read<LoginBloc>().add(
                            LoginEvent.loginWithGoogle(),
                          ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
