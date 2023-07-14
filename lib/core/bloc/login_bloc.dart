import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vba_crypto_signal/core/data/remote/auth/auth_interface.dart';
import 'package:vba_crypto_signal/core/extensions/string_extension.dart';
import 'package:vba_crypto_signal/core/utils/locator.dart';
import 'package:vba_crypto_signal/models/exception.dart';
import 'package:vba_crypto_signal/models/failure.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    final AuthService authService = locator();
    on<LoginEvent>((event, emit) async {
      if (event is LoginUserEvent) {
        try {
          emit(RequestingLogin());
          final response = await authService.login(
            email: event.email,
            password: event.password,
          );

          if (response.message == "success") {
            emit(LoginSuccessful(
                title: response.message.capitalize(),
                message: "Login Successful"));
          } else {
            emit(
              LoginFailed(
                error: UserDefinedException(
                  "Error",
                  "Invalid Credentials.",
                ),
              ),
            );
          }
        } on Failure catch (e) {
          emit(LoginFailed(error: e));
        }
      }
    });
  }
}
