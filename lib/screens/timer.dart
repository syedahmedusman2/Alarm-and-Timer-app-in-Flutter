import 'dart:async';

import 'package:alarmapp2/screens/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:numberpicker/numberpicker.dart';

class timer extends StatefulWidget {
  const timer({ Key? key }) : super(key: key);

  @override
  _timerState createState() => _timerState();
}

class _timerState extends State<timer> {
int hour = 0;
int min = 0;
int sec = 0;
bool started = true;
bool stopped = true;
int timeforTimer = 0;
String timetodisplay = "";
bool checktimer = true;
void start(){
  setState(() {
    started = false;
    stopped = false;
  });
  timeforTimer = ((hour*60*60) + (min*60) + sec);
 Timer.periodic(Duration(seconds:1), (Timer t) {
   setState(() {
     if(timeforTimer < 1 || checktimer==false){
     t.cancel();
     if(timeforTimer==0){
       print("USerr not presses");
       FlutterRingtonePlayer.playRingtone();
     }
     checktimer = true;
     timetodisplay = "";
     started = true;
     stopped= false;
    //  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>timer()));
    //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homapage()));
   }else if(timeforTimer < 60){
     timetodisplay = timeforTimer.toString();
     timeforTimer = timeforTimer -1;
   }else if(timeforTimer < 3600 ){
     int m = timeforTimer ~/ 60;
     int s = timeforTimer - (60*m);
     timetodisplay = m.toString() + ":" + s.toString();
     timeforTimer = timeforTimer-1;
   } else {
     int h = timeforTimer ~/ 3600;
     int t = timeforTimer - (3600*h);
     int m = t ~/ 60;
     int s = t - (60*m);
     timetodisplay = h.toString() + ":"  + m.toString() + ":" + s.toString();
     timeforTimer = timeforTimer-1;
   }
   
   
  //  else {
  //    timeforTimer = timeforTimer - 1;
  //  }
  //  timetodisplay = timeforTimer.toString();
   });
  });


}

void stop(){
  setState(() {
    started = true;
    stopped = true;
    checktimer = false;
  });

}
  @override
  Widget build(BuildContext context) {
    return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 20,),
        Expanded(flex: 6,
        child: Row(
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
        )),
        

        
        Expanded(flex: 1,child: Text('$timetodisplay', style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24),),),

        Expanded(flex: 3,child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
              child: RaisedButton( color: Colors.green,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Text("Start", style: TextStyle(fontSize: 18, color: Colors.white),), onPressed: 
                started ? start : null
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
              child: RaisedButton( color: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Text("Stop", style: TextStyle(fontSize: 18, color: Colors.white),), onPressed:
              stopped ? null: stop
            ))
          ],
        )),
      ],
    ),
  );
  }
}

