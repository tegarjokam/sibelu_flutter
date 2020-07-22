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
    // int statusCode;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      yield LoginFailure('network lost');
      return;
    }

    if (loginBody.username == null || loginBody.username.isEmpty) {
      yield LoginFailure('Username is required');
      return;
    } else if (loginBody.password == null || loginBody.username.isEmpty) {
      yield LoginFailure('Password is required');
      return;
    }
    print('sebelum manggil loading..');
    yield LoginLoading();
    Token token = await apiAuthRepository.postLoginUser(loginBody);
    print('pesan error ==> ' + token.error.toString());
    print('..........');
    if (token.error != null) {
      if (int.parse(token.error) == 401 || int.parse(token.error) == 400) {
        yield LoginFailure('Your nip or password incorrect');
        return;
      } else if (int.parse(token.error) == 404) {
        yield LoginFailure('Server not found');
        return;
      } else {
        yield LoginFailure('Something error on server');
        return;
      }
    }
    print('1111');
    if (token.error == null) {
      yield LoginSuccess();
      return;
    }
    // try {
    //   yield LoginLoading();
    //   Token token = await apiAuthRepository.postLoginUser(loginBody);
    //   print('tokeenn..... ' + token.error);
    //   statusCode = int.parse(token.error);
    //   print('apakah error kosong ? ${token.error.isNotEmpty}');
    //   print('ERROR = ' + token.error);
    //   if (token.error.isEmpty == false) {
    //     print('masukk error');
    //     print('status code = ' + statusCode.toString());
    //     if (statusCode == 401 || statusCode == 400) {
    //       yield LoginFailure('Your nip or password incorrect');
    //       return;
    //     } else if (statusCode == 404) {
    //       yield LoginFailure('Server not found');
    //       return;
    //     } else {
    //       yield LoginFailure('Something error on server');
    //       return;
    //     }
    //   }
    // } catch (_) {
    //   if (statusCode == null) {
    //     print('status code null = ' + statusCode.toString());
    //     try {
    //       final result = await InternetAddress.lookup('google.com');
    //       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    //         print('connected');
    //         yield LoginSuccess();
    //       }
    //     } on SocketException catch (_) {
    //       yield LoginFailure('network lost');
    //     }
    //   }
    // }

    print('lewat get token');
  }
}
