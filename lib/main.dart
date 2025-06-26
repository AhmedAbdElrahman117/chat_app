import 'package:chat_app/Features/Auth/Presentation/Views%20Model/Login%20Cubit/login_cubit.dart';
import 'package:chat_app/Features/Auth/Presentation/Views%20Model/Sign%20Up%20Cubit/sign_up_cubit.dart';
import 'package:chat_app/Features/Auth/Presentation/Views/Login/login_view.dart';
import 'package:chat_app/Features/Auth/Presentation/Views/Sign%20Up/sign_up_view.dart';
import 'package:chat_app/Features/Auth/Presentation/Views/Verification/verification_view.dart';
import 'package:chat_app/Features/Chat/Presentation/Views%20Model/chat_cubit.dart';
import 'package:chat_app/Features/Chat/Presentation/Views/chat_view.dart';
import 'package:chat_app/Features/Home/Presentation/Views%20Model/Chats%20Cubit/chats_cubit.dart';
import 'package:chat_app/Features/Home/Presentation/Views%20Model/Friends%20Cubit/friends_cubit.dart';
import 'package:chat_app/Features/Home/Presentation/Views/home_view.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  EmailOTP.config(
    appName: 'Chat App',
    otpLength: 6,
    otpType: OTPType.numeric,
    appEmail: 'ChatApp@gmail.com',
    emailTheme: EmailTheme.v3,
  );

  runApp(const ChatApp());
}

class ChatApp extends StatefulWidget {
  const ChatApp({super.key});

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen(
          (event) {},
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SignUpCubit()),
        BlocProvider(create: (context) => FriendsCubit()),
        BlocProvider(create: (context) => ChatsCubit()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: checkUser(context),
            routes: {
              'login': (context) => const LoginView(),
              'signup': (context) => const SignUpView(),
              'verify': (context) => const VerificationView(),
              'home': (context) => const HomeView(),
              'chat': (context) => const ChatView(),
            },
          );
        },
      ),
    );
  }

  checkUser(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      BlocProvider.of<LoginCubit>(context)
          .rememberUser(FirebaseAuth.instance.currentUser!);
      return 'home';
    } else {
      return 'login';
    }
  }
}
