import 'package:chat_app/Features/Auth/Presentation/Views%20Model/Login%20Cubit/login_cubit.dart';
import 'package:chat_app/Features/Auth/Presentation/Views%20Model/Login%20Cubit/login_states.dart';
import 'package:chat_app/Features/Auth/Presentation/Views/Login/Widgets/create_account_text.dart';
import 'package:chat_app/Features/Auth/Presentation/Views/Login/Widgets/login_button.dart';
import 'package:chat_app/Features/Auth/Presentation/Views/Login/Widgets/login_email_text_field.dart';
import 'package:chat_app/Features/Auth/Presentation/Views/Login/Widgets/login_password_text_field.dart';
import 'package:chat_app/Features/Auth/Presentation/Views/Widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> loginKey = GlobalKey();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Form(
      key: loginKey,
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<LoginCubit, LoginStates>(
            listener: (context, state) {
              BlocProvider.of<LoginCubit>(context).checkState(
                context,
                state,
                emailController.text,
              );
            },
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: state is LoginLoading,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.28),
                    const Center(child: Logo()),
                    LoginEmailTextField(
                      emailController: emailController,
                    ),
                    LoginPasswordTextField(
                      passwordController: passwordController,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 20),
                      child: CreateAccountText(),
                    ),
                    LoginButton(
                      emailController: emailController,
                      passwordController: passwordController,
                      loginKey: loginKey,
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
