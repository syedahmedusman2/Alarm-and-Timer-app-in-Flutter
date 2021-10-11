import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';


class Alarm extends StatefulWidget {
  const Alarm({ Key? key }) : super(key: key);

  @override
  _AlarmState createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  int hour = 0;
int min = 0;
int sec = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        
        children: [
          
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: 
            EdgeInsets.only(bottom: 10),
            child: Text("HH",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700
            ),),
            ),
                NumberPicker(
                  infiniteLoop: true,
                  itemWidth: 50,
                  minValue: 0, maxValue: 23, 
                  value: hour,
                   onChanged:(val){
                     setState(() {
                       hour = val;
                     });

                   }),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: 
            EdgeInsets.only(bottom: 10),
            child: Text("MM",style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700
            ),),
            ),
                NumberPicker(
                infiniteLoop: true,  
                  
                  itemWidth: 50,
                 
                  minValue: 0, maxValue: 60, 
                  value: min,
                   onChanged:(val){
                     setState(() {
                       min = val;
                     });

                   }),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: 
            EdgeInsets.only(bottom: 10),
            child: Text("SS",style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700
            ),),
            ),
                NumberPicker(
                  infiniteLoop: true,
                  itemWidth: 50,
                  minValue: 0, maxValue: 60, 
                  value: sec,
                   onChanged:(val){
                     setState(() {
                       sec = val;
                     });

                   }),
              ],
            )
          ],
        )
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