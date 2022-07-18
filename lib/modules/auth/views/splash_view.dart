import 'package:flutter/material.dart';
import 'package:telegram_clone/modules/auth/views/login_view.dart';

import '../../../common/constants/colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  navToLoginScreen() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginView.routeName,
      (route) => false,
    );
  }

  @override
  void initState() {
    navToLoginScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon.png',
              scale: 6,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Telegram',
              style: const TextStyle(
                color: AppColors.whiteColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
