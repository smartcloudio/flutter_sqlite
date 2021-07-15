import 'package:flutter_app/provider/app_provider.dart';
import 'package:flutter_app/provider/users.dart';
import 'package:flutter_app/provider/usuarios.dart';
import 'package:flutter_app/routes/app_routes.dart';
import 'package:flutter_app/util/consts.dart';
import 'package:flutter_app/util/theme_config.dart';
import 'package:flutter_app/views/main_screen.dart';
import 'package:flutter_app/views/user_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/user_list.dart';
import 'package:flutter_app/views/usuario_form.dart';
import 'package:flutter_app/views/usuario_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => AppProvider()),
        ChangeNotifierProvider(create: (ctx) => Users()),
        ChangeNotifierProvider(create: (ctx) => Usuarios()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, Widget child) {
        return MaterialApp(
          key: appProvider.key,
          debugShowCheckedModeBanner: false,
          navigatorKey: appProvider.navigatorKey,
          title: Constants.appName,
          theme: themeData(appProvider.theme),
          darkTheme: themeData(ThemeConfig.darkTheme),
          //home: MainScreen(),
          routes: {
            AppRoutes.HOME: (_) => MainScreen(),
            AppRoutes.USER_LIST: (_) => UserList(),
            AppRoutes.USER_FORM: (_) => UserForm(),
            AppRoutes.USUARIO_LIST: (_) => UsuarioList(),
            AppRoutes.USUARIO_FORM: (_) => UsuarioForm()
          },
        );
      },
    );
  }

  ThemeData themeData(ThemeData theme) {
    return theme.copyWith(
      textTheme: GoogleFonts.sourceSansProTextTheme(
        theme.textTheme,
      ),
    );
  }
}


