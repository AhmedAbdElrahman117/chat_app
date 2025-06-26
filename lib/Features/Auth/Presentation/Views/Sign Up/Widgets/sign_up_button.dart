import 'package:chat_app/Features/Auth/Presentation/Views%20Model/Sign%20Up%20Cubit/sign_up_cubit.dart';
import 'package:chat_app/Features/Auth/Presentation/Views/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton(
      {super.key,
      required this.signUpKey,
      required this.usernameController,
      required this.emailController,
      required this.passwordController});

  final GlobalKey<FormState> signUpKey;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Sign Up',
      onPressed: () {
        if (signUpKey.currentState!.validate()) {
          BlocProvider.of<SignUpCubit>(context).signUp(
            name: usernameController.text,
            email: emailController.text,
            password: passwordController.text,
          );
        }
      },
    );
  }
}
