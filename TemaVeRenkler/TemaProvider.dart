
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyThemeModel extends ChangeNotifier{
  final String key ="theme";
  bool _islightTheme;
  SharedPreferences _pref;
  bool get isLightTheme=>_islightTheme;
  MyThemeModel(){
    _islightTheme=true;
    _loadFromPrefs();
  }
  void changeTheme(){
    _islightTheme=!_islightTheme;
    _saveToPrefs();
    notifyListeners();
  }
  _initPrefs()async{
    if(_pref==null)
      _pref=await SharedPreferences.getInstance();
  }
  _loadFromPrefs()async{
    await _initPrefs();
    _islightTheme=_pref.getBool(key)?? true;
    notifyListeners();
  }
  _saveToPrefs()async{
    await _initPrefs();
    _pref.setBool(key, _islightTheme);
  }
}
