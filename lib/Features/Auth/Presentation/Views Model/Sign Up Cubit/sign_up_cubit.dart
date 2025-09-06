import 'package:chat_app/Features/Auth/Data/user_model.dart';
import 'package:chat_app/Features/Auth/Presentation/Views%20Model/Sign%20Up%20Cubit/sign_up_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitial());

  FirebaseFirestore db = FirebaseFirestore.instance;

  UserCredential? userData;

  UserModel? user;

  void verifyEmail() async {
    await EmailOTP.sendOTP(email: user!.email);
  }

  void signUp(
      {required String name,
      required String email,
      required String password}) async {
    emit(SignUpLoading());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (value) async {
          user = UserModel(
            name: name,
            email: email,
            uid: value.user!.uid,
          );
          await db.collection('users').doc(value.user!.uid).set(user!.toMap());
          await value.user!.updateDisplayName(name);
        },
      );

      verifyEmail();
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      String message = checkSignUpFireBaseErrorMessage(e.code);
      emit(SignUpFailure(errorMessage: message));
    } on Exception catch (e) {
      emit(SignUpFailure(errorMessage: e.toString()));
    }
  }

  userVerified() async {
    await db
        .collection('users')
        .doc(userData!.user!.uid)
        .update({'verify': true});
  }

  String checkSignUpFireBaseErrorMessage(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'Email Already in Use';
      case 'invalid-email':
        return 'Invalid Email';
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

  void checkState(SignUpStates state, BuildContext context) {
    if (state is SignUpFailure) {
      showMessage(context, message: state.errorMessage);
    } else if (state is SignUpSuccess) {
      Navigator.pushNamed(context, 'verify');
    }
  }

  showMessage(BuildContext context, {required String message}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
