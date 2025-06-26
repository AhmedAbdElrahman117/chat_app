import 'package:chat_app/Features/Auth/Presentation/Views%20Model/Login%20Cubit/login_cubit.dart';
import 'package:chat_app/Features/Auth/Presentation/Views/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.loginKey});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> loginKey;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Login',
      onPressed: () {
        if (loginKey.currentState!.validate()) {
          BlocProvider.of<LoginCubit>(context).login(
            email: emailController.text,
            password: passwordController.text,
          );
        }
        // Navigator.pushNamed(context, 'home');
      },
    );
  }
}
