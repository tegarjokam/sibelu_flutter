import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:sibelu_app/api/api_auth_repository.dart';
import 'package:sibelu_app/models/login/login_body.dart';
import 'package:sibelu_app/models/token/token.dart';

abstract class LoginState {}

class LoginIntial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);
}

class LoginSuccess extends LoginState {}

class LoginEvent extends LoginState {
  final LoginBody loginBody;

  LoginEvent(this.loginBody);
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiAuthRepository apiAuthRepository = ApiAuthRepository();

  @override
  LoginState get initialState => LoginIntial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    LoginBody loginBody = event.loginBody;
    int statusCode;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      yield LoginFailure('network lost');
    }

    if (loginBody.username == null || loginBody.username.isEmpty) {
      yield LoginFailure('Username is required');
      return;
    } else if (loginBody.password == null || loginBody.username.isEmpty) {
      yield LoginFailure('Password is required');
      return;
    }

    try {
      yield LoginLoading();
      Token token = await apiAuthRepository.postLoginUser(loginBody);
      print('tokeenn..... ' + token.error);
      statusCode = int.parse(token.error);
      print('apakah error kosong ? ${token.error.isNotEmpty}');
      print('ERROR = ' + token.error);
      if (token.error.isEmpty == false) {
        print('masukk error');
        print('status code = ' + statusCode.toString());
        if (statusCode == 401 || statusCode == 400) {
          yield LoginFailure('your nip or password incorrect');
          return;
        } else {
          yield LoginFailure('something error on server');
          return;
        }
      }
    } catch (_) {
      if (statusCode == null) yield LoginSuccess();
    }
    print('lewat get token');
  }
}

// Token token =
//           await apiAuthRepository.postLoginUser(loginBody).then((value) {
//         print('is not empty 1 ? ${value.error.isNotEmpty}');
//         print('is empty ? ${value.error.isEmpty}');
//         if (value.error.isEmpty) {
//           print('TIDDAK ADA ERROR...');
//           print('token = ${value.accessToken}');
//           return value;
//         } else {
//           print('token = ${value.accessToken}');
//           statusCode = int.parse(value.error);
//           print('percobaan error ' + statusCode.toString());
//           throw 'error bangett';
//         }
//       }).catchError((onError) async* {
//         print('error');
//         print(onError);
//         if (statusCode == 401) {
//           print('masuk statuscode');
//           yield LoginFailure('your nip or password incorrect');
//         } else {
//           yield LoginFailure('something error on server');
//         }
//       });
//       print('TOKENNNNNN = ' + token.accessToken.toString());
//     } catch (_) {
//       print(_.toString());
//       print('STATUS ERROR CODE = ' + statusCode.toString());
