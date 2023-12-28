import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class LocalNotifyManager {
  var initSetting;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  BehaviorSubject<ReceiveNotification> get didReceiveLocalNotificationSubject =>
      BehaviorSubject<ReceiveNotification>();

  LocalNotifyManager.init() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    if (Platform.isIOS) {
      requestIOSPermission();
    }
    initializePlatform();
  }

  requestIOSPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>().requestPermissions(alert: true, badge: true, sound: true);
  }

  initializePlatform() {
    var initSettingAndroid =
        AndroidInitializationSettings('app_notification_icon');

    initSetting = InitializationSettings(
        android: initSettingAndroid);
  }

  setOnNotificationReceive(Function onNotificationReceive) {
    didReceiveLocalNotificationSubject.listen((notification) {
      onNotificationReceive(notification);
    });
  }

  setOnNotificationClick(Function onNotificationClick) async {
    await flutterLocalNotificationsPlugin.initialize(initSetting,
        onSelectNotification: (payload) async {
      onNotificationClick(payload);
    });
  }

  Future<void> showDailyNotification() async {
    var time = Time(12, 10, 0);
    var androidChannel = AndroidNotificationDetails(
        'CHANNEL_ID', 'Günlük Hatırlatma', 'CHANNEL_DESCRIPTION',
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        color: Colors.greenAccent,
        styleInformation: BigTextStyleInformation(''));
    var iosChannel = IOSNotificationDetails();
    var platformChannel =
        NotificationDetails(android: androidChannel, iOS: iosChannel);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
        0,
        'Selam!',
        'Geçmişte bugün gerçekleşenlere göz atmak ister misin?',
        time,
        platformChannel,
        payload: 'New Payload');
  }

  Future<void> turnOffNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
    print("kapandı");
  }
}

LocalNotifyManager localNotifyManager = LocalNotifyManager.init();

class ReceiveNotification {
  final int id;
  final String title;
  final String body;
  final String payload;

  ReceiveNotification(
      {@required this.id,
      @required this.title,
      @required this.body,
      @required this.payload});
}
