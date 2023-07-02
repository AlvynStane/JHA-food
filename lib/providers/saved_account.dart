import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class Account {
  String username;
  String password;
  String email;
  String phonenum;
  double? balance;

  Account(
      this.username, this.password, this.email, this.phonenum, this.balance);
}

class LoginResult {
  final bool success;
  final Account? account;

  LoginResult(this.success, {this.account});
}

class AccountProvider with ChangeNotifier {
  List<Account> accountList = [
    Account('Guest', '1', 'guest@gmail.com', '081234567890', 0),
    Account('a', '1', 'aaa@gmail.com', '081714384288', 1000),
  ];

  bool createNewAcc(
    String username,
    String password,
    String email,
    String phonenum,
    double balance,
    Function(String) showErrorSnackBar,
  ) {
    bool duplicateEmail = accountList.any((account) => account.email == email);
    bool duplicateUname =
        accountList.any((account) => account.username == username);

    if (!duplicateEmail && !duplicateUname) {
      accountList.add(Account(username, password, email, phonenum, balance));
      return true;
    }
    if (duplicateUname) {
      showErrorSnackBar("Username already exist!");
    }
    if (duplicateEmail) {
      showErrorSnackBar("Email already exist!");
    }
    return false;
  }

  LoginResult checkLoginCredentials(
    String emailOrUsername,
    String password,
    Function(String) showErrorSnackBar,
  ) {
    Account? account = accountList.firstWhereOrNull(
      (acc) => acc.email == emailOrUsername || acc.username == emailOrUsername,
    );

    if (account != null) {
      if (account.password == password) {
        print('Login successful!');
        return LoginResult(true, account: account);
      } else {
        showErrorSnackBar('Incorrect password!');
      }
    } else {
      showErrorSnackBar('Email/Username not found!');
    }

    return LoginResult(false);
  }

  Account? _loggedInAccount;

  Account? get loggedInAccount => _loggedInAccount;

  void login(Account account) {
    _loggedInAccount = account;
    notifyListeners();
  }

  void logout() {
    _loggedInAccount = null;
    notifyListeners();
  }

  void editProfile(
      String newUsername, String newEmail, String newPass, String newPhone) {
    if (_loggedInAccount != null) {
      _loggedInAccount!.username = newUsername;
      _loggedInAccount!.email = newEmail;
      _loggedInAccount!.password = newPass;
      _loggedInAccount!.phonenum = newPhone;
      notifyListeners();
    }
  }
}
