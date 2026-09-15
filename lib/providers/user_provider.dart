import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/user_data_model.dart';
import '../services/database_helper.dart';

class UserProvider extends ChangeNotifier {
  User? _currentUser;

  User? get currentUser => _currentUser;

  bool get isAuthenticated => _currentUser != null;

  Future<bool> login(String email, String password) async {
    final userData = await DatabaseHelper.instance.loginUser(email, password);
    if (userData != null) {
      _currentUser = User.fromMap(userData);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> register(String name, String email, String password) async {
    try {
      final id = await DatabaseHelper.instance.registerUser(name, email, password);
      if (id > 0) {
        _currentUser = User(id: id, name: name, email: email, password: password);
        notifyListeners();
        return true;
      }
    } catch (e) {
      // Handle email unique constraint error or other db issues
    }
    return false;
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}

final userProvider = ChangeNotifierProvider<UserProvider>((ref) {
  return UserProvider();
});
