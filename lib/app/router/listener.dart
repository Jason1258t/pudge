import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/features/auth/application/auth_state_notifier.dart';

class RouterListener extends ChangeNotifier {
  RouterListener(this._ref) {
    _ref.listen(authStateNotifierProvider, (previous, next) {
      if (previous.runtimeType != next.runtimeType) {
        notifyListeners();
      }
    });
  }

  final Ref _ref;
}