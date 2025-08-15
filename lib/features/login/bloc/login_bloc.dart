import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/usecases/sign_in_google_usecase.dart';


part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SignInGoogleUsecase signInGoogleUsecase;
  LoginBloc(this.signInGoogleUsecase) : super(const _Initial()) {
    on<_LoginWithGoogle>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await signInGoogleUsecase.call();
        result.fold(
          (email) {
            emit(_Success(email));
          },
          (error) {
            emit(_Failure('Failed to login: $error'));
          },
        );
      } catch (e) {
        emit(_Failure('Failed to login: $e'));
      }
    });
  }
}
