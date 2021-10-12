import 'dart:async';

import 'package:android_alarm_manager/android_alarm_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:numberpicker/numberpicker.dart';
showprint(){
  print("HELLOW ROD");
}

class Alarm extends StatefulWidget {
  const Alarm({Key? key}) : super(key: key);

  @override
  _AlarmState createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  int hour = 0;
  int min = 0;
  int sec = 0;
  void alarmfire() {
    print("Alarm Fired at ${DateTime.now()}");
    // print("object");
  }

  hello() {
    FlutterRingtonePlayer.playRingtone();
// print("Print thi");
  }

  stop() {
    FlutterRingtonePlayer.stop();
  }

  check() {
    Timer(Duration(seconds: 1), hello);
  }

  bool ison = false;
  fun() async {
    print("Pressed");
    // AndroidAlarmManager.oneShot(Duration(seconds: 3),0, hello);
    AndroidAlarmManager.oneShotAt(DateTime(2021, 10, 12, 14, 50), 72, hello);
//  await AndroidAlarmManager.periodic(const Duration(seconds: 5), 0,hello(), exact: true);
    // Timer(Duration(seconds: 10), ()=>debugPrint("Hello World"));
    // AndroidAlarmManager.periodic(Duration(seconds: 11), 10,check());
    // final int alarmid = 0;
    // await AndroidAlarmManager.periodic(Duration(seconds: 3), alarmid, hello(),
    // startAt: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour, 50 ),);

    // AndroidAlarmManager.periodic(
    //  const Duration(seconds: 2), 0,
    //  ()=>debugPrint("Ran"),
    //  startAt:
    //  startAt: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour, (DateTime.now().minute + 1) ),
// );
// AndroidAlarmManager.oneShot(delay, id, callback)
  }
  void runAlarm(minu){
    AndroidAlarmManager.oneShotAt(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour, minu), 7, runAlarm);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                AndroidAlarmManager.cancel(72);
              },
              child: Text("child2")),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    fun();
                  },
                  child: Text("child")),
              ElevatedButton(
                  onPressed: () {
                    stop();
                  },
                  child: Text("Stop")),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "HH",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  NumberPicker(
                      infiniteLoop: true,
                      itemWidth: 50,
                      minValue: 0,
                      maxValue: 23,
                      value: hour,
                      onChanged: (val) {
                        setState(() {
                          hour = val;
                        });
                      }),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "MM",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  NumberPicker(
                      infiniteLoop: true,
                      itemWidth: 50,
                      minValue: 0,
                      maxValue: 60,
                      value: min,
                      onChanged: (val) {
                        setState(() {
                          min = val;
                        });
                      }),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "SS",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  NumberPicker(
                      infiniteLoop: true,
                      itemWidth: 50,
                      minValue: 0,
                      maxValue: 60,
                      value: sec,
                      onChanged: (val) {
                        setState(() {
                          sec = val;
                        });
                      }),
                ],
              )
            ],
          ),
          Switch(
              value: ison,
              onChanged: (value) {
                setState(() {
                  ison = value;
                });
                 print(ison);
                if (ison == true) {
                  // alarmfire();
                  // AndroidAlarmManager.oneShot(Duration(seconds: 5), 34, alarmfire);
                  AndroidAlarmManager.oneShot(Duration(seconds: 5), 111, showprint);
                  // runAlarm(58);
                  // AndroidAlarmManager.oneShotAt(
                      // DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour, 36), 72, alarmfire);
                }
                else
                  AndroidAlarmManager.cancel(72);
              }),

              ElevatedButton(onPressed: (){
                AndroidAlarmManager.periodic(Duration(seconds: 10), 120, showprint);
              }, child: Text("child")),
          // Text(DateTime.now().toString(   ))
          // Text(DateTime.now().timeZoneName)
          Text(DateTime.now().millisecondsSinceEpoch.toString()),
          Text(
            DateTime.now().year.toString(),
          ),
          Text(DateTime.now().month.toString()),
          Text(DateTime.now().weekday.toString()),
          Text(DateTime.now().day.toString()),
          Text(DateTime.now().minute.toString()),
          Text(DateTime.now().second.toString()),
          // Text("${DateTime.now().year}:${DateTime.now().month}: ${DateTime.now().day}: ${DateTime.now().hour}: ${DateTime.now().minute}")

          // settime - millisedondssinceepoch = timer time
        ],
      ),
    );
  }
}
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Ringtone player'),
//         ),
//         body: Center(
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding: EdgeInsets.all(8),
//                 child: RaisedButton(
//                   child: const Text('playAlarm'),
//                   onPressed: () {
//                     FlutterRingtonePlayer.playAlarm();
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8),
//                 child: RaisedButton(
//                   child: const Text('playAlarm asAlarm: false'),
//                   onPressed: () {
//                     FlutterRingtonePlayer.playAlarm(asAlarm: false);
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8),
//                 child: RaisedButton(
//                   child: const Text('playNotification'),
//                   onPressed: () {
//                     FlutterRingtonePlayer.playNotification();
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8),
//                 child: RaisedButton(
//                   child: const Text('playRingtone'),
//                   onPressed: () {
//                     FlutterRingtonePlayer.playRingtone();
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8),
//                 child: RaisedButton(
//                   child: const Text('play'),
//                   onPressed: () {
//                     FlutterRingtonePlayer.play(
//                       android: AndroidSounds.notification,
//                       ios: IosSounds.glass,
//                       looping: true,
//                       volume: 1.0,
//                     );
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8),
//                 child: RaisedButton(
//                   child: const Text('stop'),
//                   onPressed: () {
//                     FlutterRingtonePlayer.stop();
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
