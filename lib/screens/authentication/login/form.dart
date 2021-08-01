import 'package:flutter/material.dart';
import 'package:peliculas_app_fluter/services/authentication_service.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Email', hintText: 'Email'),
        ),
        TextField(
          decoration:
              InputDecoration(labelText: 'Password', hintText: 'Password'),
        ),
        FlatButton(
            onPressed: () {
              AuthenticationService.signin();
            },
            child: Text('Login'))
      ],
    );
  }
}
