/*
* Created by mahmud on Sat Jun 25 2022
* Email mahmud120398@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'dart:convert';
import 'package:uuid/uuid.dart';

class UserData {
  String userId;
  String userName;
  String userMobileNumber;
  String userEmail;
  String userPassword;

  UserData({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userMobileNumber,
    required this.userPassword,
  });

  /// when user register as letter
  factory UserData.anonymouse() {
    return UserData(
      userId: const Uuid().v4(),
      userName: "anonime",
      userMobileNumber: "0822222222222",
      userEmail: "anonime@gmail.com",
      userPassword: "anonime",
    );
  }

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "userName": userName,
        "userMobilePhone": userMobileNumber,
        "userEmail": userEmail,
        "userPassword": userPassword,
      };

  String toJson() => json.encode(toMap());
  factory UserData.fromJson(String data) {
    return UserData.fromMap(json.decode(data));
  }

  factory UserData.fromMap(Map<String, dynamic> data) {
    return UserData(
      userId: data['userId'],
      userName: data['userName'],
      userEmail: data['userEmail'],
      userMobileNumber: data['userMobilePhone'],
      userPassword: data['userPassword'],
    );
  }
}
