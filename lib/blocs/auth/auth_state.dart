
import 'package:firebase_auth/firebase_auth.dart';

import '../../data/model/forum_status/form_status.dart';

class AuthState {
  final ForumStatus status;
  final User? user;
  final String errorMessage;

  const AuthState({
    required this.status,
    required this.user,
    required this.errorMessage,
  });

  AuthState copyWith({
    String? errorMessage,
    ForumStatus? status,
    User? user,
  }) =>
      AuthState(
        errorMessage: errorMessage ?? this.errorMessage,
        status: status ?? this.status,
        user: user ?? this.user,
      );

  static AuthState initialValue() => const AuthState(
        errorMessage: '',
        status: ForumStatus.initial,
        user: null,
      );
}
