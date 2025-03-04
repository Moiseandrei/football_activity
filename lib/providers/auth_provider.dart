import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  void signIn(String email, String password) {
    // Simulăm autentificarea (ar trebui să fie cu Firebase)
    if (email == "test@test.com" && password == "password123") {
      _isAuthenticated = true;
      notifyListeners();
    }
  }

  void signOut() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
