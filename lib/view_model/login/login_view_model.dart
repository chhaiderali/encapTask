import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class LoginViewModel with ChangeNotifier {
  bool _loginLoading = false;
  bool get loginLoading => _loginLoading;

  setLoginLoading(bool value) {
    _loginLoading = value;
    notifyListeners();
  }

  String _email = '';
  String get email => _email;

  setEmail(String email) {
    _email = email;
  }

  String _password = '';
  String get password => _password;

  setPassword(String password) {
    _password = password;
  }
}
