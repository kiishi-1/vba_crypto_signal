import 'package:vba_crypto_signal/core/constants/api_routes.dart';
import 'package:vba_crypto_signal/core/data/remote/auth/auth_interface.dart';
import 'package:vba_crypto_signal/core/utils/app_logger.dart';
import 'package:vba_crypto_signal/core/utils/network_client.dart';
import 'package:vba_crypto_signal/models/login_response.dart';

class AuthRepositoryImpl implements AuthRepository {
  final _log = appLogger(AuthRepository);
  late final NetworkClient _networkClient = NetworkClient();

  @override
  Future<LoginResponse> login(
      {required String email, required String password}) async {
    final response = await _networkClient.post(ApiRoute.login, body: {
      "email": email,
      "password": password,
    });
    _log.i(response);
    return LoginResponse.fromJson(response);
  }
}
