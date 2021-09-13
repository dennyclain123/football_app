import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefer{
  static saveData(String key,String value)async{
    SharedPreferences shp = await SharedPreferences.getInstance();
    return shp.setString(key,value);
  }
  static Future<String> getData(String key)async{
    SharedPreferences shp = await SharedPreferences.getInstance();
    return shp.getString(key);
  }
}