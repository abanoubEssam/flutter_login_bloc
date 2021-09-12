import 'dart:async';

import 'package:login_bloc/src/blocs/validators.dart';

class Bloc with Validators {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  Function(String) get changeEmail => _emailController.sink.add;
  Stream<String> get email => _emailController.stream.transform(validateEmail);

  Function(String) get changePasswod => _passwordController.sink.add;
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
