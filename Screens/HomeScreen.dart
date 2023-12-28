import 'package:bugunun_tarihi1/BildirimAyarlar/LocalNotifyManager.dart';
import 'package:flutter/material.dart';

import '../Gunler.dart';
import 'IconBari.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override

  void initState() {
    super.initState();
    localNotifyManager.initializePlatform();
    localNotifyManager.setOnNotificationReceive(onNotificationReceive);
    localNotifyManager.setOnNotificationClick(onNotificationClick);
  }

  onNotificationReceive(ReceiveNotification notification){
    print('Notification Received: ${notification.id}');
  }

  onNotificationClick(String payload){
    print('Payload $payload');
  }
  @override
  Widget build(BuildContext context) {
    String bugun = DateTime.now().day.toString() + DateTime.now().month.toString();
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[

              Expanded(
                child: Gunler().bilgiCek(bugun),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.08,
                color: Theme.of(context).primaryColor,
                child: IconBari(),
              )
            ],
          ),
        ));
  }
}
