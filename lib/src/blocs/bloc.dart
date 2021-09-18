import 'dart:async';

import 'package:login_bloc/src/blocs/validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get changeEmail => _emailController.sink.add;
  Stream<String> get email => _emailController.stream.transform(validateEmail);

  Function(String) get changePasswod => _passwordController.sink.add;
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      CombineLatestStream.combine2(email, password, (a, b) => true);

  submit() {
    final validEmail = _emailController.valueOrNull;
    final validPassword = _passwordController.value;

    print(validEmail);
    print(validPassword);
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
