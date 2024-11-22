import 'package:flutter/material.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User? _currentUser;
  final List<User> _users = [];

  User? get currentUser => _currentUser;

  void register(String username, String password) {
    final user = User(username: username, password: password);
    _users.add(user);
    _currentUser = user;
    notifyListeners();
  }

  bool login(String username, String password) {
    final user = _users.firstWhere(
      (user) => user.username == username && user.password == password,
      orElse: () => User(username: '', password: ''),
    );
    if (user.username.isNotEmpty) {
      _currentUser = user;
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}