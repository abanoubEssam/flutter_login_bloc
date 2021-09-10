import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [emailField(), passwordField()],
      ),
    );
  }

  Widget emailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Enter MAil",
        labelText: "Email",
      ),
    );
  }

  Widget passwordField() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Password please",
        labelText: "Password",
      ),
      obscureText: true,
    );
  }

  Widget submitButton() {
    return TextButton(
      onPressed: () => print("object"),
      child: Text("Click me"),
    );
  }
}
