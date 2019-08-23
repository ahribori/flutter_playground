import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin extends StatelessWidget {
  handleSignIn() {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: ['email'],
    );

    Future<void> _handleSignIn() async {
      try {
        final result = await _googleSignIn.signIn();
        final authentication = await result.authentication;
        final accessToken = authentication.accessToken;
        print(accessToken);
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
          'Google Login',
        ),
      ),
    );
  }
}
