import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibelu_app/bloc/dashboard/dashboard_bloc.dart';
import 'package:sibelu_app/bloc/login/login_bloc.dart';

class Dashboard extends StatefulWidget {
  Dashboard();

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashboardBloc _dashBloc = DashboardBloc();

  @override
  void initState() {
    print('PEMBUATAN DASHBOARD STATE');
    _dashBloc.add(DashboardEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DashboardBloc, DashboardState>(
      listener: (BuildContext context, DashboardState state) {
        if (state is DashboardFailure) {
          Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.redAccent,
              child: Center(
                child: Text(
                  'Failed to fetch profile..',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          );
        }
      },
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading) {
            return Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              ),
            );
          } else if (state is DashboardSuccess) {
            return Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text('Hai ' + state.user.fullName),
                ),
              ),
            );
          } else {
            print('STATE ===> ' + state.toString());

            return Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(child: Text('BLANKK...')),
              ),
            );
          }
        },
      ),
    );
  }
}
