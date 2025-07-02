import 'package:pudge/core/exceptions/auth_exceptions.dart';

sealed class AppAuthorizationState {}

class AppUnAuthState extends AppAuthorizationState {}

final class AppAuthLoadingState extends AppUnAuthState {}

final class AppAuthErrorState extends AppUnAuthState {
  final AppAuthException exception;

  AppAuthErrorState(this.exception);
}

final class AppAuthState extends AppAuthorizationState {}
