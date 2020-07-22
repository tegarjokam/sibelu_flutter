import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:sibelu_app/api/api_auth_repository.dart';
import 'package:sibelu_app/models/user/user_model.dart';

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardFailure extends DashboardState {
  final String error;

  DashboardFailure(this.error);
}

class DashboardSuccess extends DashboardState {
  User user;

  DashboardSuccess(this.user);
}

class DashboardEvent extends DashboardState {}

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final ApiAuthRepository apiAuthRepository = ApiAuthRepository();

  @override
  DashboardState get initialState => DashboardInitial();

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    yield DashboardLoading();
    User user = await apiAuthRepository.getUser();
    print('proses');
    if (user.error != null) {
      print('gagal fetch data');
      yield DashboardFailure(user.error);
      return;
    } else if (user.error == null) {
      print('Sukses ambil data');
      yield DashboardSuccess(user);
      return;
    }
  }
}
