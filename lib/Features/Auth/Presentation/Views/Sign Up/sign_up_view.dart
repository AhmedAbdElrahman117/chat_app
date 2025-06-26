import 'package:chat_app/Features/Auth/Presentation/Views%20Model/Sign%20Up%20Cubit/sign_up_cubit.dart';
import 'package:chat_app/Features/Auth/Presentation/Views%20Model/Sign%20Up%20Cubit/sign_up_states.dart';
import 'package:chat_app/Features/Auth/Presentation/Views/Sign%20Up/Widgets/have_an_account_text.dart';
import 'package:chat_app/Features/Auth/Presentation/Views/Sign%20Up/Widgets/sign_up_button.dart';
import 'package:chat_app/Features/Auth/Presentation/Views/Sign%20Up/Widgets/sign_up_email_text_field.dart';
import 'package:chat_app/Features/Auth/Presentation/Views/Sign%20Up/Widgets/sign_up_password_text_field.dart';
import 'package:chat_app/Features/Auth/Presentation/Views/Sign%20Up/Widgets/sign_up_user_name_text_field.dart';
import 'package:chat_app/Features/Auth/Presentation/Views/Widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> signUpKey = GlobalKey();
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Form(
      key: signUpKey,
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<SignUpCubit, SignUpStates>(
            listener: (context, state) {
              BlocProvider.of<SignUpCubit>(context).checkState(state, context);
            },
            builder: (context, state) => ModalProgressHUD(
              inAsyncCall: state is SignUpLoading,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.25),
                  const Center(child: Logo()),
                  SignUpUserNameTextField(
                    usernameController: usernameController,
                  ),
                  SignUpEmailTextField(
                    controller: emailController,
                  ),
                  SignUpPasswordTextField(
                    passwordController: passwordController,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: HaveAnAccountText(),
                  ),
                  SignUpButton(
                    signUpKey: signUpKey,
                    usernameController: usernameController,
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
