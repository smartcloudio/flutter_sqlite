import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_app/models/usuario.dart';
import 'package:flutter_app/provider/usuarios.dart';
import 'package:flutter_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// The adapter from COD3R to store in SQLite
class UsuarioTile extends StatelessWidget {
  final UserNew user;
  UsuarioTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CachedNetworkImage(
          imageUrl: user.avatarUrl,
          imageBuilder: (context, imageProvider) => Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
              image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => CircleAvatar(
          backgroundColor: Colors.orange,
          child: Icon(Icons.person),
      ),
    );
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            color: Colors.orange,
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(AppRoutes.USUARIO_FORM, arguments: user);
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            color: Colors.red,
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Excluir usuário'),
                  content: Text('Tem Certeza?'),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text('Não'),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text('Sim'),
                    )
                  ],
                ),
              ).then((confirmed) {
                if (confirmed) {
                  print('Excluir');
                  Provider.of<Usuarios>(context, listen: false).onDelete(user);
                }
              });
            },
          )
        ]),
      ),
    );
  }
}
