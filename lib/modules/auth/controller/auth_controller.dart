import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telegram_clone/modules/auth/repositories/auth_repository.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository);
});

class AuthController {
  final AuthRepository authRepository;
  AuthController({
    required this.authRepository,
  });

  void getOtp(BuildContext context, String phoneNumber) async {
    authRepository.verifyPhone(context, phoneNumber);
  }

  void verifyOtp(
      BuildContext context, String verificationId, String otpCode) async {
    authRepository.verifyOtp(context, verificationId, otpCode);
  }
}
