import 'package:flutter_app/models/usuario.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/provider/usuarios.dart';
import 'package:provider/provider.dart';

class UsuarioForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, Object> _formData = {};

  void _loadFormData(UserNew user) {
    _formData['id'] = user.id;
    _formData['name'] = user.name;
    _formData['email'] = user.email;
    _formData['avatarUrl'] = user.avatarUrl;
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context).settings.arguments as UserNew;
    if (user != null) {
      _loadFormData(user);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Usuário'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();
              if (isValid) {
                _form.currentState.save();

                var user = UserNew();
                user.id = _formData['id'];
                user.name = _formData['name'];
                user.email = _formData['email'];
                user.avatarUrl = _formData['avatarUrl'];

                Provider.of<Usuarios>(context, listen: false).put(user);
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        child: Form(
          key: _form,
          child: ListView(
            padding: EdgeInsets.all(10),
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                autocorrect: false,
                style: TextStyle(
                  fontSize: 18.0,
                ),
                decoration: InputDecoration(
                    labelText: 'Nome',
                    labelStyle: TextStyle(color: Colors.blue),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.red,
                    ),
                    contentPadding: EdgeInsets.all(
                        10), //  <- you can it to 0.0 for no space
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue))),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome Inválido!';
                  }
                  if (value.trim().length < 3) {
                    return 'Nome tem que ter no mínimo 3 letras!';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value,
              ),
              TextFormField(
                initialValue: _formData['email'],
                autocorrect: false,
                style: TextStyle(
                  fontSize: 18.0,
                ),
                decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.blue),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.red,
                    ),
                    contentPadding: EdgeInsets.all(
                        10), //  <- you can it to 0.0 for no space
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue))),
                onSaved: (value) => _formData['email'] = value,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                autocorrect: false,
                style: TextStyle(
                  fontSize: 18.0,
                ),
                decoration: InputDecoration(
                    labelText: 'Avatar Url',
                    labelStyle: TextStyle(color: Colors.blue),
                    prefixIcon: const Icon(
                      Icons.account_circle,
                      color: Colors.red,
                    ),
                    contentPadding: EdgeInsets.all(
                        10), //  <- you can it to 0.0 for no space

                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue))),
                onSaved: (value) => _formData['avatarUrl'] = value,
              )
            ],
          ),
        ),
      ),
    );
  }
}
