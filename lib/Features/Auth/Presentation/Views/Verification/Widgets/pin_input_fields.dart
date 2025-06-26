import 'package:chat_app/Features/Auth/Presentation/Views%20Model/Sign%20Up%20Cubit/sign_up_cubit.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class PinInputFields extends StatelessWidget {
  const PinInputFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Pinput(
          length: 6,
          closeKeyboardWhenCompleted: true,
          obscureText: false,
          isCursorAnimationEnabled: true,
          keyboardType: TextInputType.number,
          onCompleted: (value) async {
            if (EmailOTP.verifyOTP(otp: value)) {
              Navigator.popUntil(context, ModalRoute.withName('login'));
              BlocProvider.of<SignUpCubit>(context).showMessage(
                context,
                message: 'Verification Completed',
              );
              BlocProvider.of<SignUpCubit>(context).userVerified();
            } else {
              BlocProvider.of<SignUpCubit>(context).showMessage(
                context,
                message: 'Wrong OTP',
              );
            }
          },
        ),
      ),
    );
  }
}
