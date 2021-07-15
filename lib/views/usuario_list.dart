import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/components/usuario_tile.dart';
import 'package:flutter_app/provider/usuarios.dart';
import 'package:flutter_app/routes/app_routes.dart';
import 'package:provider/provider.dart';
import '../models/usuario.dart';

class UsuarioList extends StatefulWidget {
  @override
  _UsuarioListState createState() => _UsuarioListState();
}

class _UsuarioListState extends State<UsuarioList> {


  List<UserNew> items = new List();
  List<UserNew> usuarios;

  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {

    final Usuarios usuarios = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários - SQLITE'),
      ),
      body: getAllUsuarios(),
      floatingActionButton: _buildFab(),
    );
  }

  @override
  void initState() {
    super.initState();
    print("INIT");
    _scrollController = new ScrollController();
    _scrollController.addListener(() => setState(() {}));
  }

  Widget _buildFab() {
    bool visibilityFlag = true;
    double max;
    double currentScroll;

    if (_scrollController.hasClients) {
      max = _scrollController.position.maxScrollExtent;
      double min = _scrollController.position.minScrollExtent;
      currentScroll = _scrollController.position.pixels;

      if ((min == currentScroll) &&
          (_scrollController.position.userScrollDirection ==
              ScrollDirection.idle)) {
        visibilityFlag = true;
      } else if (max == currentScroll) {
        visibilityFlag = false;
      }
    }

    return new Visibility(
      visible: visibilityFlag,
      child: new FloatingActionButton(
        onPressed: () =>
            Navigator.of(context)
            .pushNamed(AppRoutes.USUARIO_FORM),
        tooltip: 'Increment',
        backgroundColor: Color(0xff00bfa5),
        child: Icon(Icons.add),
      ),
    );
  }


  // Name validation check with returned messages error
  String validateName(String value) {
    if (value.length < 3)
      return 'Nome deve ter no mínimo 3 caracteres!';
    else if (value.length > 40) {
      return 'Nome deve ser conter até 40 caracteres!';
    } else
      return null;
  }

  // Not implement yet
  // Avatar validation check with returned messages error
  // Cant check the valid url and if exists in future.
  // At the moment return null
  String validateAvatar(String value) {
    return null;
  }

  // Email validation check with return messages error
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Entre com um Email válido';
    else if (value.length > 40) {
      return 'Email deve ser conter até 40 caracteres!';
    } else
      return null;
  }

  // Get all users data from table user in SQLite DB 'usuarios'
  // wiht the Provider Usuarios and the getData() function
  getAllUsuarios() {
    return FutureBuilder(
        future: Provider.of<Usuarios>(context).getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return createListView(context, snapshot);
        });
  }

  // ListView Builder compose a register user from UsuarioTile Template
  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    usuarios = snapshot.data;
    if (usuarios != null) {
      CircularProgressIndicator();
      return new ListView.builder(
          itemCount: usuarios.length,
          itemBuilder: (ctx, i) {
            return UsuarioTile(usuarios[i]);
          });
    } else
      return Container();
    }
}