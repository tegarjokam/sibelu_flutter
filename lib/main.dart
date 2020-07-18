import 'package:flutter/material.dart';
import 'package:sibelu_app/constants.dart';
import 'package:sibelu_app/screens/login/login_screen.dart';

import 'screens/welcome/landing_screen.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(MyApp());
  } catch (error, stackTrace) {
    print('$error & $stackTrace');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sibelu',
      home: LandingPage(),
      theme: ThemeData(primaryColor: yellowColor),
      routes: {
        '/login_screen': (context) => LoginPage(),
        '/landing_screen': (context) => LandingPage(),
      },
    );
  }
}
