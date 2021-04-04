import 'package:shared_preferences/shared_preferences.dart';




  Future<void> setPref(String key,String value) async {

    SharedPreferences  preferences =await SharedPreferences.getInstance();
    await preferences.setString(key,value);
    print("Shared Preferences set");


  }

Future<String>  getPref(String key) async {
    SharedPreferences  preferences =await SharedPreferences.getInstance();
    return preferences.getString(key);
  }



   Future<bool> checkKey(String key) async {
    SharedPreferences  preferences =await SharedPreferences.getInstance();
    if(preferences.containsKey(key)){
      return true;
    }else
      return false;
  }



