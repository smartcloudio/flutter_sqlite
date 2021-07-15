import 'package:flutter/material.dart';

// User model from COD3R project
class User {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;

  const User(
      {
        this.id,
      @required this.name,
      @required this.email,
      @required this.avatarUrl});
}
