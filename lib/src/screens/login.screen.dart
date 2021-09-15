import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_bloc/src/blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          emailField(bloc),
          SizedBox(
            height: 10,
          ),
          passwordField(bloc),
          SizedBox(
            height: 10,
          ),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
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

  Widget passwordField(Bloc bloc) {
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
