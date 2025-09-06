// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/Features/Auth/Presentation/Views%20Model/Login%20Cubit/login_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key, required this.prefs});

  final SharedPreferences prefs;

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  User? user;
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen(
      (event) {
        user = event;
        if (user == null) {
          widget.prefs.setBool('isLogged', false);
        } else {
          widget.prefs.setBool('isLogged', true);
        }
        setState(() {});

        checkUser(context);
      },
    );

    super.initState();
  }

  Future<void> checkUser(BuildContext context) async {
    if (widget.prefs.getBool('isLogged') == true || user != null) {
      await BlocProvider.of<LoginCubit>(context).rememberUser(user!).then(
        (value) async {
          await Future.delayed(const Duration(seconds: 2));
          Navigator.pushReplacementNamed(context, 'home');
        },
      );
    } else {
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacementNamed(context, 'login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blueGrey.shade500,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 40,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/logo.png'),
              radius: 150,
              backgroundColor: Colors.white,
            ),
            SizedBox(
              height: 40,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            ),
            Text(
              'Loading...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
