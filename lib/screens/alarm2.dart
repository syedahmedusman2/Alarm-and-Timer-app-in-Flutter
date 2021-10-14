import 'dart:async';
import 'dart:isolate';
import 'dart:math';
import 'dart:ui';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

/// The [SharedPreferences] key to access the alarm fire count.
const String countKey = 'count';

/// The name associated with the UI isolate's [SendPort].
const String isolateName = 'isolate';

/// A port used to communicate from a background isolate to the UI isolate.
final ReceivePort port = ReceivePort();

/// Global [SharedPreferences] object.
late SharedPreferences prefs;

/// Example app for Espresso plugin.
class AlarmManagerExampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: _AlarmHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class _AlarmHomePage extends StatefulWidget {
  _AlarmHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _AlarmHomePageState createState() => _AlarmHomePageState();
}

class _AlarmHomePageState extends State<_AlarmHomePage> {
  int _counter = 0;
  int hours = 0;
  int mins = 0;
  int sec = 0;
  int hourforalarm = 0;
  int minforalarm = 0;
  int secforalarm = 0;

  @override
  void initState() {
    super.initState();
    AndroidAlarmManager.initialize();

    // Register for events from the background isolate. These messages will
    // always coincide with an alarm firing.
    port.listen((_) async => await _incrementCounter());
  }

  Future<void> _incrementCounter() async {
    print('Increment counter!');

    // Ensure we've loaded the updated count from the background isolate.
    await prefs.reload();

    setState(() {
      _counter++;
    });
  }

  // The background
  static SendPort? uiSendPort;

  // The callback for our alarm
  static Future<void> callback() async {
    print('Alarm fired!');

    // Get the previous cached count and increment it.
    final prefs = await SharedPreferences.getInstance();
    
    int currentCount = prefs.getInt(countKey) ?? 0;
    await prefs.setInt(countKey, currentCount + 1);
    FlutterRingtonePlayer.playAlarm();

    // This will be null if we're running in the background.
    uiSendPort ??= IsolateNameServer.lookupPortByName(isolateName);
    uiSendPort?.send(null);
  }
  final StreamController<bool> streamController = StreamController<bool>.broadcast();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline5;
    return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "HH",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            ),
                            NumberPicker(
                              zeroPad: true,
                                itemWidth: 50,
                                minValue: 0,
                                maxValue: 23,
                                value: hours,
                                onChanged: (val) {
                                 
                                  setState(() {
                                    hours = val;
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
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            ),
                            NumberPicker(
                              zeroPad: true,
                                itemWidth: 50,
                                minValue: 0,
                                maxValue: 60,
                                value: mins,
                                onChanged: (val) {
                                  setState(() {
                                    mins = val;
                                  // prefs.setInt('min', val);
                                  });
                                }),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
    
               
                // RaisedButton(onPressed: (){}, child: Text("Set Alarm")),
                OutlinedButton(
                  onPressed: () async{
                    setState(() {
                      hourforalarm = hours;
                      minforalarm = mins;
                      secforalarm = sec;
                      
                      
                      // prefs.setString(key, value)
                    });
                    prefs.setInt('hour', hourforalarm);
                     prefs.setInt('min', minforalarm);
                    // await AndroidAlarmManager.oneShotAt(
                      
                    //     DateTime(DateTime.now().year, DateTime.now().month,
                    //         DateTime.now().day,prefs.getInt('hour')!.toInt(), prefs.getInt('min')!.toInt() ),
                    //     420,
                    //     callback, wakeup: true, alarmClock: true);
                    final snackbar = SnackBar(content: Text("Alarm set for ${prefs.getInt('hour')}: ${prefs.getInt('min')}"));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  },
                  child: Text("Set Alarm"),
                ),
                // CupertinoButton.filled(child: Text("Stop"), onPressed: (){FlutterRingtonePlayer.stop();}),
                CupertinoButton(
                    child: Text("Test"),
                    onPressed: () {
                      print(prefs.getInt('hour')!.toInt());
                      print(prefs.getInt('min')!.toInt());
                      // print("${hourforalarm} : ${minforalarm} : ${secforalarm}");
                    }),
                Text(
                  'Alarm fired $_counter times',
                  style: textStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Total alarms fired: ',
                      style: textStyle,
                    ),
                    Text(
                      prefs.getInt(countKey).toString(),
                      key: ValueKey('BackgroundCountText'),
                      style: textStyle,
                    ),
                  ],
                ),
                ElevatedButton(
                  child: Text(
                    'Schedule OneShot Alarm',
                  ),
                  key: ValueKey('RegisterOneShotAlarm'),
                  onPressed: () async {
                    // await AndroidAlarmManager.oneShot(
                    //   const Duration(seconds: 5),
                    //   // Ensure we have a unique alarm ID.
                    //   Random().nextInt(pow(2, 31).toInt()),
                    //   callback,
                    //   exact: true,
                    //   wakeup: true,
                    // );
                    await AndroidAlarmManager.oneShotAt(
                        DateTime(DateTime.now().year, DateTime.now().month,
                            DateTime.now().day, prefs.getInt('hour')!.toInt(),
                             prefs.getInt('min')!.toInt()),
                        420,
                        callback);
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  
}

// Widget alert(){
//   showAlertDialog(BuildContext context) {

//   // set up the button
//   Widget okButton = TextButton(
//     child: Text("OK"),
//     onPressed: () { },
//   );

//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text("My title"),
//     content: Text("This is my message."),
//     actions: [
//       okButton,
//     ],
//   );

//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
// }


//  Expanded(
//                 child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(bottom: 10),
//                       child: Text(
//                         "HH",
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.w700),
//                       ),
//                     ),
//                     NumberPicker(
//                         itemWidth: 50,
//                         minValue: 0,
//                         maxValue: 23,
//                         value: hour,
//                         onChanged: (val) {
//                           setState(() {
//                             hour = val;
//                           });
//                         }),
//                   ],
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(bottom: 10),
//                       child: Text(
//                         "MM",
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.w700),
//                       ),
//                     ),
//                     NumberPicker(
//                         itemWidth: 50,
//                         minValue: 0,
//                         maxValue: 60,
//                         value: min,
//                         onChanged: (val) {
//                           setState(() {
//                             min = val;
//                           });
//                         }),
//                   ],
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(bottom: 10),
//                       child: Text(
//                         "SS",
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.w700),
//                       ),
//                     ),
//                     NumberPicker(
//                         itemWidth: 50,
//                         minValue: 0,
//                         maxValue: 60,
//                         value: sec,
//                         onChanged: (val) {
//                           setState(() {
//                             sec = val;
//                           });
//                         }),
//                   ],
//                 )
//               ],
//             )),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                    
                //     Expanded(
                //       child: Column(
                //         children: [
                //           Text("HH",style: TextStyle(fontWeight: FontWeight.w800),),
                //           SizedBox(height:10),
                //           NumberPicker(
                //           itemWidth: 50,
                //           minValue: 0,
                //           maxValue: 23,
                //           value: hours,
                //           onChanged: (val) {
                //             setState(() {
                //               hours = val;
                //             });
                //           }),
                //           // NumberPicker(minValue: 0, maxValue: 23, value: hour,itemWidth: 50, onChanged: (val){
                //           //   setState(() {
                //           //     hour = val;
                //           //   });
                //           // }),
                //         ],
                //       ),
                //     ),

                //     Column(
                //       children: [
                //         Text("MM",style: TextStyle(fontWeight: FontWeight.w800),),
                //         SizedBox(height:10),
                //         NumberPicker(minValue: 0, maxValue: 60,itemWidth: 50, value: mins, onChanged: (val){
                //           setState(() {
                //             mins = val;
                //           });
                //         }),
                //       ],
                //     )
                //   ],
                // )

  //               void setalarm() {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text("Set Alarm"),
  //           content: Container(
  //             height: 225,
  //             child: Column(
  //               children: [
  //                 SizedBox(
  //                   height: 30,
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         Padding(
  //                           padding: EdgeInsets.only(bottom: 10),
  //                           child: Text(
  //                             "HH",
  //                             style: TextStyle(
  //                                 fontSize: 18, fontWeight: FontWeight.w700),
  //                           ),
  //                         ),
  //                         NumberPicker(
  //                             itemWidth: 50,
  //                             minValue: 0,
  //                             maxValue: 23,
  //                             value: hours,
  //                             onChanged: (val) {
  //                               setState(() {
  //                                 hours = val;
  //                               });
  //                             }),
  //                       ],
  //                     ),
  //                     Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         Padding(
  //                           padding: EdgeInsets.only(bottom: 10),
  //                           child: Text(
  //                             "MM",
  //                             style: TextStyle(
  //                                 fontSize: 18, fontWeight: FontWeight.w700),
  //                           ),
  //                         ),
  //                         NumberPicker(
  //                             itemWidth: 50,
  //                             minValue: 0,
  //                             maxValue: 60,
  //                             value: mins,
  //                             onChanged: (val) {
  //                               setState(() {
  //                                 mins = val;
  //                               });
  //                             }),
  //                       ],
  //                     ),
  //                   ],
  //                 )
  //               ],
  //             ),
  //           ),
  //           actions: [
  //             ElevatedButton(
  //                 style: ButtonStyle(
  //                     backgroundColor:
  //                         MaterialStateProperty.all<Color>(Colors.blue)),
  //                 onPressed: () {
  //                   setState(() {
  //                     hourforalarm = hours;
  //                     minforalarm = mins;
  //                   });
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: Text("Set"))
  //           ],
  //         );
  //       });
  // }