import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telegram_clone/common/utils/utility.dart';
import 'package:telegram_clone/modules/auth/views/otp_view.dart';
import 'package:telegram_clone/modules/auth/views/user_info_view.dart';

final authRepositoryProvider = Provider((ref) {
  return AuthRepository(
    firebaseAuth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  );
});

class AuthRepository {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRepository({
    required this.firebaseAuth,
    required this.firestore,
  });

  void verifyPhone(BuildContext context, String phoneNumber) {
    try {
      firebaseAuth.verifyPhoneNumber(
        phoneNumber: '+91$phoneNumber',
        verificationCompleted: (credentails) {
          signInWithCreds(context, credentails);
        },
        verificationFailed: (e) {
          showSnackbar(context, e.message!);
        },
        codeSent: (verificationId, forceResendingToken) {
          showSnackbar(context, 'code sent SuccessFully');
          Navigator.pushNamed(context, OtpView.routeName,
              arguments: verificationId);
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message!);
    }
  }

  verifyOtp(BuildContext context, String verificationId, String otp) {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      smsCode: otp,
      verificationId: verificationId,
    );

    signInWithCreds(context, credential);
  }

  void signInWithCreds(
      BuildContext context, PhoneAuthCredential credential) async {
    try {
      UserCredential creds =
          await firebaseAuth.signInWithCredential(credential);

      if (creds.user != null) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          UserInfoView.routeName,
          (route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message!);
    }
  }
}
