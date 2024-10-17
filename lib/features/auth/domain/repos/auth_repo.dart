/*

Auth Repository - Outline the possible auth operation for this app

*/

import 'package:wegag/features/auth/domain/entities/app_user.dart';

abstract class AuthRepo {
  Future<AppUser?> logInWithEmailPassword(String email, String password);
  Future<AppUser?> registerInWithEmailPassword(
      String email, String password, String name);
  Future<void> logout();
  Future<AppUser> getCurrentUser();
}
