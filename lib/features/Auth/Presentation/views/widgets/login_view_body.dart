import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkyou_task/features/Auth/Presentation/views/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.15.w,
        ),
        child: _user != null ? _userInfo() : _googleSignIn(),
      ),
    );
  }

  Widget _googleSignIn() {
    return CustomButton(
      text: 'sign in with google',
      onPressed: () async {
        //await Firebase.initializeApp();
        _implementGoogleSignIn();
      },
    );
  }

  Widget _userInfo() {
    return SizedBox(
      child: Column(
        children: [
          Text('User: ${_user!.displayName}'),
          Text('Email: ${_user!.email}'),
          Text('Phone: ${_user!.phoneNumber}'),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(_user!.photoURL!),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _implementGoogleSignIn() {
    try {
      GoogleAuthProvider _googlAuthProvider = GoogleAuthProvider();
      _auth.signInWithProvider(_googlAuthProvider);
    } catch (error) {
      log(error.toString());
    }
  }
}