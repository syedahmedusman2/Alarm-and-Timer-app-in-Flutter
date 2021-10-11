import 'package:alarmapp2/screens/alarm.dart';
import 'package:alarmapp2/screens/stopwatch.dart';
import 'package:alarmapp2/screens/timer.dart';
import 'package:flutter/material.dart';

class Homapage extends StatefulWidget {
  const Homapage({ Key? key }) : super(key: key);

  @override
  _HomapageState createState() => _HomapageState();
}

class _HomapageState extends State<Homapage> with TickerProviderStateMixin {

  @override
  void initstate(){
    tb = TabController(length: 3,vsync: this);
    super.initState();
  }
  TabController? tb;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,initialIndex: 0,
     child: Scaffold(
       appBar: AppBar(centerTitle: true,title: Text("Clock"),
       bottom: TabBar(tabs: 
       [
         Tab(text: "Alarm"),
         Tab(text: "Timer"),
         Tab(text: "Stop Watch")
       ],labelPadding: EdgeInsets.only(bottom:
       10.0),labelStyle: TextStyle(
         fontSize: 18.0
       ),unselectedLabelColor: Colors.white54,
       ),
       ),
       body: TabBarView(children: [
        Alarm(),
        timer(),
        StopWatch()
       ]),
       
     ));
  }
}


















    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Clock"),
    //     bottom: TabBar(tabs: [
    //       Text("Alarm"),
    //       Text("Timer"),
    //       Text("Stop Watch")
    //     ],
    //     controller: tb,),
    //   ),
    //   body: TabBarView(
    //     controller: tb,
    //     children: <Widget>[
    //       Text("Alarm"),
    //       Text("Timer"),
    //       Text("Stop Watch")
    //     ],
    //   ),
      

    // );