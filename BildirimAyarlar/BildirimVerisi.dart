import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LocalNotifyManager.dart';

class Bildirim {
  Bildirim() {
    _bildirim = true;
    _loadFromPrefs();
  }

  final String key = "notify";
  SharedPreferences _pref;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  bool _bildirim;

  bool get bildirimkontrol => _bildirim;

  _initPrefs() async {
    if (_pref == null)
      _pref = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _bildirim = _pref.getBool(key) ?? true;
  }

  _saveToPrefs() async {
    await _initPrefs();
    _pref.setBool(key, _bildirim);
    print("Bildirim kaydedildi: $_bildirim");
  }


  Future <void> bildirimDegistir() async {
    _bildirim = !_bildirim;
    _saveToPrefs();
    bildirimCalistir();
    print("Bildirim durumu: $_bildirim");
  }

  Future<void> bildirimCalistir() async {
    if (_bildirim == false) {
      localNotifyManager.turnOffNotification();
      print("Bildirim Kapalı");
    } else {
      localNotifyManager.showDailyNotification();
      print("Bildirim Aktif");
    }
  }
}