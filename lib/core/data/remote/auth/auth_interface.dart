import 'package:vba_crypto_signal/models/login_response.dart';

abstract class AuthInterface {
  ///Logs user into account
  Future<LoginResponse> login({
    required String email,
    required String password,
  });
}

abstract class AuthRepository implements AuthInterface {}

abstract class AuthService implements AuthInterface {}
