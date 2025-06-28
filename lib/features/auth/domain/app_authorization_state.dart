import 'package:pudge/core/exceptions/auth_exceptions.dart';
import 'package:pudge/entities/user/user.dart';

sealed class AppAuthorizationState {}

class AppUnAuthState extends AppAuthorizationState {}

final class AppAuthorizingState extends AppUnAuthState {}

final class AppAuthErrorState extends AppUnAuthState {
  final AppAuthException exception;

  AppAuthErrorState(this.exception);
}

final class AppAuthState extends AppAuthorizationState {
  final User user;

  AppAuthState(this.user);
}
