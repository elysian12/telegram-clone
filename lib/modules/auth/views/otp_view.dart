import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:telegram_clone/common/constants/colors.dart';
import 'package:telegram_clone/modules/auth/controller/auth_controller.dart';

class OtpView extends ConsumerWidget {
  final String verificationId;

  static const String routeName = 'otp-view';

  const OtpView({
    Key? key,
    required this.verificationId,
  }) : super(key: key);

  void verifyOtp(BuildContext context, WidgetRef ref, String otp) {
    ref.read(authControllerProvider).verifyOtp(context, verificationId, otp);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verifying your number',
          style: TextStyle(
            color: AppColors.blackColor,
          ),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(
              'We have sent a SMS with a code',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.length >= 6) {
                    FocusScope.of(context).unfocus();
                    verifyOtp(context, ref, value.trim());
                  }
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '- - - - - -',
                  hintStyle: TextStyle(
                    fontSize: 26,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
