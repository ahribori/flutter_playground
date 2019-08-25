import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookLoginExample extends StatelessWidget {
  handleSignIn() {
    final facebookLogin = FacebookLogin();

    Future<void> _handleSignIn() async {
      try {
        final result = await facebookLogin.logInWithReadPermissions(['email']);
        print(result);
      } catch (error) {
        print(error);
      }
    }

    _handleSignIn();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: Colors.deepPurpleAccent,
        textColor: Colors.white,
        onPressed: () {
          handleSignIn();
        },
        child: Text(
          'Facebook Login',
        ),
      ),
    );
  }
}
