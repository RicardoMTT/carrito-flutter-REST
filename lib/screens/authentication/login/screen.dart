import 'package:flutter/material.dart';
import 'package:peliculas_app_fluter/screens/authentication/login/form.dart';
import 'package:peliculas_app_fluter/services/authentication_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Iniciar Sesión'),
                TextField(
                  decoration:
                      InputDecoration(labelText: 'Email', hintText: 'Email'),
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Password', hintText: 'Password'),
                ),
                FlatButton(
                    onPressed: () {
                      AuthenticationService.signin();
                    },
                    child: Text('Login'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
