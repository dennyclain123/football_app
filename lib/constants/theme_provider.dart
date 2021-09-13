import 'package:flutter/material.dart';
import 'package:football_app/constants/shared_preference.dart';
class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;
  checkTheme(){
    SharedPrefer.getData("theme").then((theme){
      if(theme!=null){
        if(theme=="dark"){
          themeMode = ThemeMode.dark;
        }else{
          themeMode = ThemeMode.light;
        }
        notifyListeners();
      }
    });
  }
  changeDark(){
    themeMode = ThemeMode.dark;
    SharedPrefer.saveData("theme", "dark");
    notifyListeners();
  }
  changeLight(){
    themeMode = ThemeMode.light;
    SharedPrefer.saveData("theme", "light");
    notifyListeners();
  }
}