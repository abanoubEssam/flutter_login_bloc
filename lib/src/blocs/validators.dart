import 'dart:async';

class Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (String email, EventSink<String> sink) {
      print(email);
      if (email.contains("@")) {
        sink.add(email);
      } else {
        sink.addError("Enter a valid email");
      }
    },
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (String password, EventSink<String> sink) {
    if (password.length > 4) {
      sink.add(password);
    } else {
      sink.addError("Password should be greater than 4 chars");
    }
  });
}
