import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telegram_clone/common/constants/colors.dart';
import 'package:telegram_clone/modules/auth/controller/auth_controller.dart';

class LoginView extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';
  const LoginView({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  TextEditingController phoneCotroller = TextEditingController();

  void sendOtp() {
    final phoneNumber = phoneCotroller.text.trim();
    ref.read(authControllerProvider).getOtp(context, phoneNumber);
  }

  @override
  void dispose() {
    phoneCotroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leadingWidth: 80,
        leading: Center(
          child: Container(
            margin: EdgeInsets.only(left: 20),
            width: 80,
            child: Text(
              'cancel',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        actions: [
          SizedBox(
            width: 70,
            child: IconButton(
              onPressed: sendOtp,
              icon: Text(
                'Next',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'Your Phone',
              style: TextStyle(
                fontSize: 26,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text(
                'Please confirm your country code and enter your phone number.',
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text('+91'),
                    decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey),
                          bottom: BorderSide(color: Colors.grey)),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.isEmpty) {
                          FocusScope.of(context).unfocus();
                        }
                        if (value.length >= 10) {
                          FocusScope.of(context).unfocus();
                        }
                      },
                      controller: phoneCotroller,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Your Phone Number',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
