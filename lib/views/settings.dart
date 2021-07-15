import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/provider/app_provider.dart';
import 'package:flutter_app/util/theme_config.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List items;

  @override
  void initState() {
    super.initState();
  }

  Widget _buildThemeSwitch() {
    return new Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Theme.of(context).hintColor),
          ),
        ),
        child: SwitchListTile(
          secondary: Icon(
            Feather.moon,
          ),
          title: Text(
            'Modo Noturno',
          ),
          value:
              Provider.of<AppProvider>(context).theme == ThemeConfig.lightTheme
                  ? false
                  : true,
          onChanged: (v) {
            if (v) {
              Provider.of<AppProvider>(context, listen: false)
                  .setTheme(ThemeConfig.darkTheme, 'dark');
            } else {
              Provider.of<AppProvider>(context, listen: false)
                  .setTheme(ThemeConfig.lightTheme, 'light');
            }
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    // Remove Dark Switch if Device has Dark mode enabled
    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      items.removeWhere((item) => item['title'] == 'Dark Mode');
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Configurações',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 30.0),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _buildThemeSwitch(),
        ],
      ),
    );
  }
}
