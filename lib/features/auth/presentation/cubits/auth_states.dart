/*

Auth States

 */

import 'package:wegag/features/auth/domain/entities/app_user.dart';

abstract class AuthStates {}

//initial
class AuthInitial extends AuthStates {}

//loading
class AuthLoading extends AuthStates {}

//authenticated
class Authenticated extends AuthStates {
  final AppUser user;
  Authenticated(this.user);
}

//unauthenticated
class Unauthenticated extends AuthStates {}

//errors
class AuthErrors extends AuthStates {
  final String message;
  AuthErrors(this.message);
}
