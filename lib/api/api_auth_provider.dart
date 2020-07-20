import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sibelu_app/models/login/login_body.dart';
import 'package:sibelu_app/models/token/token.dart';
import 'package:sibelu_app/utils/dio_logging_interceptior.dart';

class ApiAuthProvider {
  final Dio _dio = new Dio();
  final String _baseUrl = 'http://192.168.1.4:8081/';

  final String clientId = 'sibeluApp';
  final String clientSecret = 'sibeluSecret';

  ApiAuthProvider() {
    _dio.options.baseUrl = _baseUrl;
    _dio.interceptors.add(DioLoggingInterceptors(_dio));
  }

  Future<Token> loginUser(LoginBody loginBody) async {
    try {
      final response = await _dio.post(
        'oauth/token',
        data: FormData.fromMap(loginBody.toJson()),
        options: Options(
          headers: {
            'Authorization': 'Basic ${base64Encode(
              utf8.encode('$clientId:$clientSecret'),
            )}',
          },
        ),
      );
      return Token.fromJson(response.data);
    } on DioError catch (e) {
      // _printError(e);
      // print('STATUSSSS ..... ${e.response.statusCode.toString().isNotEmpty}');
      if (e.response.statusCode.toString().isNotEmpty) {
        print('masuk error ${e.response.statusCode}');
        return Token.withError('${e.response.statusCode}');
      }
      return Token.withError('$e');
    }
  }

  // void _printError(error, StackTrace stacktrace) {
  //   debugPrint('error: $error & stacktrace: $stacktrace');
  // }

  void _printError(error) {
    debugPrint('error: $error ');
  }
}
