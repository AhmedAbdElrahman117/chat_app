import 'package:chat_app/Features/Auth/Presentation/Views/Verification/Widgets/pin_input_fields.dart';
import 'package:chat_app/Features/Auth/Presentation/Views/Verification/Widgets/resend_code_button.dart';
import 'package:chat_app/Features/Auth/Presentation/Views/Verification/Widgets/verify_text.dart';
import 'package:flutter/material.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.25),
          const VerifyText(),
          const PinInputFields(),
          const SizedBox(height: 40),
          const Center(
            child: Text(
              'Did\'t Recieve Code?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          const ResendCodeButton(),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
        ],
      ),
    );
  }
}
