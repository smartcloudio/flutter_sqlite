import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final String tableName = 'usuarios';
final String tableUser = 'user';
final String columnId = '_id';
final String columnName = 'name';
final String columnEmail = 'email';
final String columnAvatarUrl = 'avatarUrl';



showtoast(String string) {
  Fluttertoast.showToast(
      msg: "$string",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey[800],
      textColor: Colors.white,
      fontSize: 16.0);
}
