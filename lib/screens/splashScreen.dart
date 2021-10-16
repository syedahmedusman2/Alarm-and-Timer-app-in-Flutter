import 'package:alarmapp2/screens/homepage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();

    
    
  }
  navigate()async{
    await Future.delayed(Duration(milliseconds: 2500),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homapage()));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Text("Al Clock", style: TextStyle(
           fontSize: 25, fontWeight: FontWeight.w700, color: Colors.blue
          ),),
          SizedBox(height: 16,),
          Image(image: NetworkImage('https://media.giphy.com/media/lTjXSsPmX3Jdx4J7DU/giphy.gif'), height: 120, width: 120,)

        ],),
      ),
      
    );
  }
}