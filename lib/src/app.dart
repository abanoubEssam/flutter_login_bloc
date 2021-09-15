import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/provider.dart';
import 'package:login_bloc/src/screens/login.screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: "Log me in",
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
