import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telegram_clone/common/constants/colors.dart';
import 'package:telegram_clone/firebase_options.dart';
import 'package:telegram_clone/modules/auth/views/splash_view.dart';
import 'package:telegram_clone/router.dart';
import 'package:telegram_clone/temp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telegram Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: AppColors.whiteColor,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.whiteColor,
            iconTheme: IconThemeData(
              color: AppColors.blackColor,
            ),
            elevation: 0,
          )),
      home: TempScreen(),
      onGenerateRoute: onGenerateRoute,
    );
  }
}
