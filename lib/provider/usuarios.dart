import 'package:flutter_app/database/database.dart';
import 'package:flutter_app/models/usuario.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/utils/Utils.dart';

// Class Provider from COD3R to adaper to store in SQLite
class Usuarios with ChangeNotifier {

    List<UserNew> items = new List();

    ///Fetch data from database
    Future<List<UserNew>> getData() async {
      var dbHelper = Helper();
      await dbHelper.getAllUsers().then((value) {
        items = value;
      });

      return items;
    }

    void put(UserNew user) {
      if (user == null) {
        return;
      }

      if (user.id != null) {
        var dbHelper = Helper();
        dbHelper.update(user).then((value) => {
          showtoast('Usuário Alterado com Sucesso!')
        }
        );
      } else {
        var dbHelper = Helper();
        dbHelper.insert(user).then((value) => {
          showtoast('Usuário Inserido com Sucesso!')
        });
      }
      notifyListeners();
    }

    void onDelete(UserNew values) {
      var id = values.id;
      var dbHelper = Helper();
      dbHelper.delete(id).then((value) => {
        showtoast('Usuário Excluído com Sucesso!')
      });
      notifyListeners();
    }

}
