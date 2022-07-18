import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:telegram_clone/common/widgets/error_widget.dart';
import 'package:telegram_clone/modules/auth/views/login_view.dart';
import 'package:telegram_clone/modules/auth/views/otp_view.dart';
import 'package:telegram_clone/modules/auth/views/user_info_view.dart';
import 'package:telegram_clone/modules/contact/view/contact_view.dart';
import 'package:telegram_clone/modules/home/views/home_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  log(settings.name!);
  switch (settings.name) {
    case LoginView.routeName:
      return MaterialPageRoute(
        builder: (_) => LoginView(),
      );
    case HomeView.routeName:
      return MaterialPageRoute(
        builder: (_) => HomeView(),
      );
    case ContactView.routeName:
      return MaterialPageRoute(
        builder: (_) => ContactView(),
      );
    case UserInfoView.routeName:
      return MaterialPageRoute(
        builder: (_) => UserInfoView(),
      );
    case OtpView.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => OtpView(
          verificationId: verificationId,
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (_) =>
            ErrorView(errorMessage: 'This page doesn\'t exists !!!'),
      );
  }
}
