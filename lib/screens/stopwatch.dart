// import 'package:flutter/material.dart';

// class HomePageWidget extends StatefulWidget {


//   @override
//   _HomePageWidgetState createState() => _HomePageWidgetState();
// }

// class _HomePageWidgetState extends State<HomePageWidget> {
//   bool _loadingButton1 = false;
//   bool _loadingButton2 = false;
//   bool _loadingButton3 = false;
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       backgroundColor: Color(0xFFF7F3F3),
//       body: SafeArea(
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
//               child: Image.network(
//                 'https://pngimg.com/uploads/stopwatch/stopwatch_PNG140.png',
//                 width: 200,
//                 height: 200,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Align(
//               alignment: AlignmentDirectional(0.05, 0.05),
//               child: Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 20),
//                 child: Text(
//                   '00:00:00',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontFamily: 'Poppins',
//                     fontSize: 26,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Align(
//                   alignment: AlignmentDirectional(0.1, -0.1),
//                   child: Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 100),
//                     // child: ElevatedButton.icon(
//                     //   onPressed: () {
//                     //     print('Button pressed ...');
//                     //   },
//                     //   label: Text('Start'),
//                     //   icon: Icon(
//                     //     Icons.play_arrow_rounded,
//                     //     size: 30,
//                     //   ),
//                     //   options: FFButtonOptions(
//                     //     width: 130,
//                     //     height: 40,
//                     //     color: Color(0xFF1D501A),
//                     //     textStyle:textsy(
//                     //       fontFamily: 'Poppins',
//                     //       color: Colors.white,
//                     //     ),
//                     //     elevation: 10,
//                     //     borderSide: BorderSide(
//                     //       color: Colors.transparent,
//                     //     ),
//                     //     borderRadius: 20,
//                     //   ),
//                     //   loading: _loadingButton1,
//                     // ),
//                     child: ElevatedButton.icon(onPressed: (){}, icon: Icon(
//                         Icons.play_arrow_rounded,
//                         size: 30,
//                       ), label: Text("Start"),style: ElevatedButton.styleFrom(
//                         elevation: 
                        
//                       ),
//                       ),
//                   ),
//                 ),
//                 Column(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Align(
//                       alignment: AlignmentDirectional(0.05, 0.2),
//                       child: FFButtonWidget(
//                         onPressed: () {
//                           print('Button pressed ...');
//                         },
//                         text: 'Stop',
//                         icon: Icon(
//                           Icons.stop_rounded,
//                           size: 30,
//                         ),
//                         options: FFButtonOptions(
//                           width: 130,
//                           height: 40,
//                           color: Color(0xFFE23535),
//                           textStyle:TextStyle(
//                             fontFamily: 'Poppins',
//                             color: Colors.white,
//                           ),
//                           elevation: 10,
//                           borderSide: BorderSide(
//                             color: Colors.transparent,
//                             width: 1,
//                           ),
//                           borderRadius: 20,
//                         ),
//                         loading: _loadingButton2,
//                       ),
//                     )
//                   ],
//                 ),
//                 Expanded(
//                   child: Align(
//                     alignment: AlignmentDirectional(-0.5, 0.7),
//                     child: Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 100),
//                       child: ElevatedButton.icon(
//                         onPressed: () {
//                           print('Button pressed ...');
//                         },
//                         label: Text('Pause'),
//                         icon: Icon(
//                           Icons.pause_sharp,
//                           size: 30,
//                         ),
//                        style: ElevatedButton.s(
//                           width: 130,
//                           height: 40,
//                           color: Colors.blue,
//                           textStyle: TextStyle(
//                             fontFamily: 'Poppins',
//                             color: Colors.white,
//                           ),
//                           elevation: 10,
//                           borderSide: BorderSide(
//                             color: Colors.transparent,
//                             width: 1,
//                           ),
//                           borderRadius: 20,
//                         ),
//                         loading: _loadingButton3,
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
