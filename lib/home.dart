import 'package:flutter/material.dart';
import 'package:internship_project/Login.dart';
import 'package:internship_project/Record.dart';
import 'package:internship_project/Test.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: Stack (
       children: [
         Positioned(
           top: 30,
           left: -25,
           child: Image.asset(
             'assets/logo.png',
             width: 350,
           ),
         ),

         Padding(
           padding:  EdgeInsets.fromLTRB(30, 150, 30, 50),
           child: Container(
             child: Image.asset('assets/dep.png'),
           ),
         ),
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Padding(
               padding:  EdgeInsets.fromLTRB(0, 380, 0, 0),
               child: Center(
                 child:
                 SizedBox(
                   height: 50,
                   width: 350,
                   child: ElevatedButton(
                     onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => TestPage()));
                     },
                     child: Text('Take a Test',style: TextStyle(fontSize: 30),),
                     style: ButtonStyle(
                       backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                     ),
                   ),
                 ),
               ),
             ),
             Padding(
               padding:  EdgeInsets.fromLTRB(0, 40, 0, 0),
               child: Center(
                 child:
                 SizedBox(
                   height: 50,
                   width: 160,
                   child: ElevatedButton(
                     onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                     },
                     child: Text('LOGOUT',style: TextStyle(fontSize: 30),),
                     style: ButtonStyle(
                       backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                     ),
                   ),
                 ),
               ),
             ),
           ],
         ),
       ],
     ),
    );
  }
}
