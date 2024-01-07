import 'package:flutter/material.dart';

import 'base_auth_user_provider.dart';

abstract class AuthManager {
  Future signOut();
  Future deleteUser(BuildContext context);
  Future updateEmail({required String email, required BuildContext context});
  Future resetPassword({required String email, required BuildContext context});
  Future sendEmailVerification() async => currentUser?.sendEmailVerification();
  Future refreshUser() async => currentUser?.refreshUser();
}

mixin EmailSignInManager on AuthManager {
  Future<BaseAuthUser?> signInWithEmail(
    BuildContext context,
    String email,
    String password,
  );

  Future<BaseAuthUser?> createAccountWithEmail(
    BuildContext context,
    String email,
    String password,
  );
}

mixin JwtSignInManager on AuthManager {
  Future<BaseAuthUser?> signInWithJwtToken(
    BuildContext context,
    String jwtToken,
  );
}
