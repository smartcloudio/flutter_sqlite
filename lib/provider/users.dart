import 'dart:math';
import 'package:flutter_app/data/dummy_users.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

// Class Provider for COD3R
class Users with ChangeNotifier {

  Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

   User byIndex(int i) {
     return _items.values.elementAt(i);
   }

  void remove(User user) {
    if (user != null || user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {

      _items.update(
          user.id,
          (_) => User(
                id: user.id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => User(
                id: id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    }
    notifyListeners();
  }
}