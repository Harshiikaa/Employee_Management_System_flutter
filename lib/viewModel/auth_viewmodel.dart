import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/user_model.dart';
import '../repositories/user_repositories.dart';
import '../services/firebase_service.dart';

class AuthViewModel with ChangeNotifier {
  User? _user = FirebaseService.firebaseAuth.currentUser;

  User? get user => _user;

  UserModel? _loggedInUser;
  UserModel? get loggedInUser => _loggedInUser;

  Future<void> login(String email, String password) async {
    try {
      var response = await UserRepo().login(email, password);
      _user = response.user;
      _loggedInUser = await UserRepo().getUserDetail(_user!.uid);
      notifyListeners();
    } catch (err) {
      UserRepo().logout();
      rethrow;
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await UserRepo().resetPassword(email);
      notifyListeners();
    } catch (err) {
      rethrow;
    }
  }

  Future<void> register(UserModel user) async {
    try {
      var response = await UserRepo().register(user);
      _user = response!.user;
      _loggedInUser = await UserRepo().getUserDetail(_user!.uid);
      notifyListeners();
    } catch (err) {
      UserRepo().logout();
      rethrow;
    }
  }

  Future<void> checkLogin() async {
    try {
      _loggedInUser = await UserRepo().getUserDetail(_user!.uid);
      notifyListeners();
    } catch (err) {
      _user = null;
      UserRepo().logout();
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await UserRepo().logout();
      _user = null;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
