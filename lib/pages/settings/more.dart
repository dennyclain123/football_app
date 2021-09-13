import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:football_app/constants/theme_provider.dart';
import 'package:provider/provider.dart';
class Settings extends StatefulWidget {

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.brightness_3),
            title: Text("Night Mode"),
            trailing: Consumer<ThemeProvider>(
                builder: (context, ThemeProvider tp,child){
                  return Switch(
                    value: tp.themeMode == ThemeMode.dark,
                    onChanged: (isOn){
                      if(isOn){
                        tp.changeDark();
                      }else{
                        tp.changeLight();
                      }
                    },
                  );
                }
            ),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.star,size: 18),
            title: Text("Give Rating"),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.share,size: 18),
            title: Text("Share with friends"),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.ellipsisH,size: 18),
            title: Text("Other apps"),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.mailBulk,size: 18),
            title: Text("Contact Us"),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.grinStars,size: 18),
            title: Text("Special Credit"),
          ),
        ],
      ),
    );
  }
}
