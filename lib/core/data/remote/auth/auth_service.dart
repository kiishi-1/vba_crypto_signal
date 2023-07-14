import 'package:vba_crypto_signal/core/data/remote/auth/auth_interface.dart';
import 'package:vba_crypto_signal/core/utils/locator.dart';
import 'package:vba_crypto_signal/models/login_response.dart';

class AuthServiceImpl implements AuthService {
  final AuthRepository _authRepository;

  AuthServiceImpl({
    AuthRepository? authRepository,
  }) : _authRepository = authRepository ?? locator();

  @override
  Future<LoginResponse> login(
      {required String email, required String password}) {
    final response = _authRepository.login(email: email, password: password);

    return response;
  }
}
