/*
* Created by mahmud on Sat Jun 25 2022
* Email mahmud120398@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  Storage._privateConstructor();
  static Storage instance = Storage._privateConstructor();

  /// flutter local storage instance
  final FlutterSecureStorage _scureStorage = const FlutterSecureStorage();

  /// all key used for store and read data
  static String loginUserKey = "LOGIN_USER_KEY";
  static String signUpLaterKey = "SIGN_UP_LATER_KEY";
  static String passOnBoardingKey = "PASSED_ON_BOARDING_KEY";

  static String userLoginData = "USER_LOGIN_DATA";

  /// read is login user
  Future<bool> isLoginUser() async {
    final res = await _scureStorage.read(key: loginUserKey);
    return res != null && res.isNotEmpty;
  }

  Future<bool> isPassedOnboardingApp() async {
    final res = await _scureStorage.read(key: passOnBoardingKey);
    return res != null && res.isNotEmpty;
  }

  Future<bool> isSignUpLater() async {
    final res = await _scureStorage.read(key: signUpLaterKey);
    return res != null && res.isNotEmpty;
  }

  void setLoginUser() async {
    await _scureStorage.write(key: loginUserKey, value: 'true');
  }

  void setPassedOnBoardingApp() async {
    await _scureStorage.write(key: passOnBoardingKey, value: 'true');
  }

  void setSignUpLater() async {
    await _scureStorage.write(key: signUpLaterKey, value: 'true');
  }

  void saveUserLogin(String data) async {
    await _scureStorage.write(key: userLoginData, value: data);
  }

  Future<String?> loadUserLogin() async {
    return await _scureStorage.read(key: userLoginData);
  }
}
