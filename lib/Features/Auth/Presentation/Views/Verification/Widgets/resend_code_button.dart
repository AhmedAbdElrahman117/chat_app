import 'package:chat_app/Features/Auth/Presentation/Views%20Model/Sign%20Up%20Cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResendCodeButton extends StatelessWidget {
  const ResendCodeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        BlocProvider.of<SignUpCubit>(context).verifyEmail();
      },
      child: const Text(
        'Resend',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
