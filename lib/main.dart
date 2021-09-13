import 'package:flutter/material.dart';
import 'package:football_app/pages/home/home.dart';
import 'package:provider/provider.dart';

import 'constants/theme_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=>ThemeProvider(),
        child: PreApp()
    );
  }
}
class PreApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context,listen: false);
    themeProvider.checkTheme();
    return Consumer<ThemeProvider>(
        builder: (context, ThemeProvider tp,child){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Home(),
            theme: ThemeData(
              primaryColor: Colors.deepPurple,
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              primaryColor: Colors.deepPurpleAccent,
              brightness: Brightness.dark,
            ),
            themeMode: tp.themeMode,
          );
        }
    );
  }
}

