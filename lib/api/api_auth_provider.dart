import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sibelu_app/models/login/login_body.dart';
import 'package:sibelu_app/models/token/token.dart';
import 'package:sibelu_app/models/user/user_model.dart';
import 'package:sibelu_app/utils/dio_logging_interceptior.dart';

class ApiAuthProvider {
  final Dio _dio = new Dio();
  final String _baseUrl = 'http://192.168.1.8:8081/';

  final String clientId = 'sibeluApp';
  final String clientSecret = 'sibeluSecret';

  ApiAuthProvider() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = 3000;
    _dio.options.receiveTimeout = 3000;
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
      print('apakah lewat ? yaa');
      return Token.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error.toString());
      if (e.type == DioErrorType.RESPONSE) {
        if (e.response.statusCode == 400) {
          return Token.withError('400');
        } else if (e.response.statusCode == 401) {
          return Token.withError('401');
        } else {
          return Token.withError('404');
        }
      } else if (e.type == DioErrorType.DEFAULT) {
        return Token.withError('404');
      } else {
        return Token.withError('404');
      }
    }
  }

  Future<User> getUser() async {
    try {
      final response = await _dio.get('api/rest/account/v1/employee/profile',
          options: Options(headers: {
            'requirestoken': true,
          }));
      if (response.statusCode == 200) {
        print('2000000');
      } else if (response.statusMessage != null) {
        print(response.statusCode);
        print(response.statusMessage);
      }
      return User.fromJson(response.data);
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        print('connection timeout');
        return User.withError('404');
      }
      if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
        print('receive timeout');
        return User.withError('404');
      }
      if (e.response.statusCode.toString().isNotEmpty) {
        print('masuk error ${e.response.statusCode}');
        return User.withError('${e.response.statusCode}');
      }
      return User.withError('$e');
    }
  }

  // void _printError(error, StackTrace stacktrace) {
  //   debugPrint('error: $error & stacktrace: $stacktrace');
  // }
}
