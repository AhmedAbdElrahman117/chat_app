// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/Features/Auth/Data/user_model.dart';
import 'package:chat_app/Features/Auth/Presentation/Views%20Model/Login%20Cubit/login_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());

  FirebaseFirestore db = FirebaseFirestore.instance;

  UserModel userData = UserModel(name: '', email: '', uid: '');

  void login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      userData = UserModel(
        name: credential.user!.displayName!,
        email: email,
        uid: credential.user!.uid,
        verified: await checkUserVerification(credential.user!.uid),
      );
    } on FirebaseAuthException catch (e) {
      emit(
        LoginFailure(
          errorMessage: checkLoginFireBaseErrorMessage(e.code),
        ),
      );
    } on Exception catch (e) {
      emit(LoginFailure(errorMessage: e.toString()));
    }
  }

  Future<bool> checkUserVerification(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> isVerified =
        await db.collection('users').doc(uid).get();
    if (isVerified.data()!['verify']) {
      emit(LoginSuccess());
      return true;
    } else {
      emit(LoginPending());
      return false;
    }
  }

  String checkLoginFireBaseErrorMessage(String code) {
    switch (code) {
      case 'user-disabled':
        return 'User Account is Diabled Contact Support';
      case 'user-not-found':
        return 'No Such Email Found';
      case 'invalid-email':
        return 'Invalid Email';
      case 'wrong-password':
        return 'Wrong Password';
      case 'INVALID_LOGIN_CREDENTIALS':
      case 'invalid-credential':
        return 'Email Or Password is Invalid';
      case 'operation-not-allowed':
        return 'Email is Not Enabled Contact Support';
      case 'too-many-requests':
        return 'Try Again Later';
      case 'network-request-failed':
        return 'Check Your Internet Connection And Try Again Later';
      default:
        return '';
    }
  }

  void checkState(BuildContext context, LoginStates state, String email) async {
    if (state is LoginSuccess) {
      Navigator.pushReplacementNamed(context, 'home');
    } else if (state is LoginFailure) {
      showMessage(
        context,
        message: state.errorMessage,
      );
    } else if (state is LoginPending) {
      Navigator.pushReplacementNamed(context, 'verify');
      if (EmailOTP.isOtpExpired()) {
        await EmailOTP.sendOTP(email: email);
      }
    }
  }

  showMessage(BuildContext context, {required String message}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> rememberUser(User user) async {
    userData = UserModel(
      name: user.displayName ?? "sss",
      email: user.email!,
      uid: user.uid,
      verified: await checkUserVerification(user.uid),
    );
  }
}
