import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_bloc/src/blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  final bloc = Bloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          emailField(),
          SizedBox(
            height: 10,
          ),
          passwordField(),
          SizedBox(
            height: 10,
          ),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Enter Mail",
              labelText: "Email",
              errorText: snapshot.hasError ? snapshot.error.toString() : null,
            ),
            onChanged: (value) => bloc.changeEmail(value),
          );
        });
  }

  Widget passwordField() {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          decoration: InputDecoration(
            hintText: "Password please",
            labelText: "Password",
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
          obscureText: true,
          onChanged: bloc.changePasswod,
        );
      },
    );
  }

  Widget submitButton() {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.amber,
        backgroundColor: Colors.blue,
      ),
      onPressed: () => print("object"),
      child: Text("Click me"),
    );
  }
}
