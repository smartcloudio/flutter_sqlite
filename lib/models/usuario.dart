import 'package:flutter_app/utils/Utils.dart';

// New User model adapter with Map<String, dynamic>
// Id is now int type index
class UserNew {
  int id;
  String name;
  String avatarUrl;
  String email;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnAvatarUrl: avatarUrl,
      columnEmail: email
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  UserNew();

  UserNew.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    avatarUrl = map[columnAvatarUrl];
    email = map[columnEmail];
  }
}