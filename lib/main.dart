import 'dart:ui';

import 'package:alarmapp2/screens/alarm2.dart';
import 'package:alarmapp2/screens/homepage.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
printHello(){
  print("Hello World");
}
// void main() async{
//     WidgetsFlutterBinding.ensureInitialized();

//   await AndroidAlarmManager.initialize();
//   await AndroidAlarmManager.periodic(const Duration(seconds: 3), 420, printHello);             
//   runApp(MyApp());
// }

Future<void> main() async {
  // TODO(bkonyi): uncomment
  WidgetsFlutterBinding.ensureInitialized();

  // Register the UI isolate's SendPort to allow for communication from the
  // background isolate.
  IsolateNameServer.registerPortWithName(
    port.sendPort,
    isolateName,
  );
  prefs = await SharedPreferences.getInstance();
  if (!prefs.containsKey(countKey)) {
    await prefs.setInt(countKey, 0);
  }
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: Homapage(),
    );
  }
}
