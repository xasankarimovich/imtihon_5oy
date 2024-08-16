
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../model/network_response.dart';

class FirebaseAuthService {
  final FirebaseAuth authService = FirebaseAuth.instance;
  final sl = GetIt.instance;

  Future<NetworkResponse> register(String email, String password) async {
    try {
      await authService.createUserWithEmailAndPassword(
          email: email, password: password);
      return NetworkResponse(
        data: authService.currentUser,
      );
    } catch (e) {
      return NetworkResponse(
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> login(String email, String password) async {
    try {
      await authService.signInWithEmailAndPassword(
          email: email, password: password);
      return NetworkResponse(
        data: authService.currentUser,
      );
    } catch (e) {
      return NetworkResponse(
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> logout() async {
    await authService.signOut();
  }
}
