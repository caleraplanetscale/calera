import 'package:calera/firebase/resolvers/auth.dart';
import 'package:calera/firebase/schemas/user.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final Auth _auth = Auth();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    try {
      User user = await _auth.getUserDetails();
      _user = user;
      notifyListeners();
    } catch (error) {
      print('Error al refrescar usuario: $error');
    }
  }
}