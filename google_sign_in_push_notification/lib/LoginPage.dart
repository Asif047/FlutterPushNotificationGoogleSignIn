import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';



GoogleSignIn _googleSignIn = GoogleSignIn(
  signInOption: SignInOption.standard,
  serverClientId: "546233373963-bvsk7u57aneev56pmpedp6lja7djbbva.apps.googleusercontent.com",
  scopes: <String>[
    'email',
  ],
);

class LoginPage extends StatefulWidget {

  static GoogleSignInAccount? accountGlobal;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var tokenJWT = '';


  @override
  void initState() {
    super.initState();

    final dio = Dio();

    _googleSignIn.signInSilently();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [


            SizedBox(height: 100,),

            // Image.asset('assets/images/townhall_logo.png', height: 200.h, width: 200.h, fit: BoxFit.fill,),

            InkWell(
              onTap: () {
                _handleSignIn();
              },
              child: Padding(
                padding:  EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Image.asset('assets/images/google_logo.png', height: 40, width: 40, fit: BoxFit.contain,),

                        SizedBox(width: 10,),

                        Text('Sign In with Google', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.blue),)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSignIn() async {

    try {
      final result = await _googleSignIn.signIn();
      final googleKey = await result?.authentication;

      debugPrint("###AAA3:${googleKey?.accessToken}");
      debugPrint("###AAA4:${googleKey?.idToken}");
      debugPrint(_googleSignIn.currentUser?.displayName);

      LoginPage.accountGlobal = _googleSignIn.currentUser!!;


    } catch (error) {
      debugPrint(error.toString());
    } finally {

    }
  }


  GoogleSignInAccount? getGoogleSignInAccount() {
    return _googleSignIn.currentUser;
  }
}
