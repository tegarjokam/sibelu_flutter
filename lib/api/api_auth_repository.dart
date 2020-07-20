import 'package:sibelu_app/bloc/login/login_bloc.dart';
import 'package:sibelu_app/models/login/login_body.dart';
import 'package:sibelu_app/models/token/token.dart';

import 'api_auth_provider.dart';

class ApiAuthRepository {
  final ApiAuthProvider _apiAuthProvider = ApiAuthProvider();

  Future<Token> postLoginUser(LoginBody loginBody) =>
      _apiAuthProvider.loginUser(loginBody);
}
