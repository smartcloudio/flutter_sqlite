import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/util/theme_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  // Aqui vamos guardar no shared_preferences algumas vars:
  // O login cujo estado é 'not_implement_yet' mas deixei a function checkLoggedin
  // para storar com shared_preferences e checar se o usuario está logado ou não.
  // Uso OAuth2 para autenticar. Ainda nesta classe faço um storage do Token
  // para depois usar no header da API quando 'need_authenticated_with_bearer'.
  // Estas funcões eu tirei da class pois não usaremos acesso a Rest API hoje!!!
  // 😉 Vamos la codar mais um pouco pra finalizar (First a brake to a coffe!!!)

  AppProvider() {
    checkTheme();
    checkLoggedin();
  }

  ThemeData theme = ThemeConfig.lightTheme;
  Key key = UniqueKey();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void setKey(value) {
    key = value;
    notifyListeners();
  }

  void setNavigatorKey(value) {
    navigatorKey = value;
    notifyListeners();
  }

  // Vamos armazenar o theme no SharedPreferences
  // Assim quando acessamos o sistema já altera pro theme
  // Armazenado na var 'theme'
  void setTheme(value, c) {
    theme = value;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('theme', c).then((val) {
        SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor:
          c == 'dark' ? ThemeConfig.darkPrimary : ThemeConfig.lightPrimary,
          statusBarIconBrightness:
          c == 'dark' ? Brightness.light : Brightness.dark,
        ));
      });
    });
    notifyListeners();
  }

  // The get
  ThemeData getTheme(value) {
    return theme;
  }

  // The check function start when construct this class
  // To check the initial theme settings
  // --------- AppProvider() {checkTheme()} ------------------
  //----------------------------------------------------------
  Future<ThemeData> checkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ThemeData t;
    String r = prefs.getString('theme') ?? 'light';
    if (r == 'light') {
      t = ThemeConfig.lightTheme;
      setTheme(ThemeConfig.lightTheme, 'light');
    } else {
      t = ThemeConfig.darkTheme;
      setTheme(ThemeConfig.darkTheme, 'dark');
    }
    return t;
  }

  // Similar to the theme method you can store the state of the user in
  // your application using SharedPreferences
  //------------------( Not Implement Yet) ----------------------------
  bool loggedin = false;

   void setLoggedin(value) {
     loggedin = value;
     SharedPreferences.getInstance().then((prefs) {
        prefs.setBool('loggedin', value).then((val) {
      });
    });
    notifyListeners();
  }

  bool getLoggedin() {
    return loggedin;
  }

  Future<bool> checkLoggedin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool login = prefs.getBool('loggedin') ?? false;
        setLoggedin(login);
    return login;
  }

}






