import 'package:flutter/material.dart';
import 'package:internship_project/start.dart';

import 'home.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
           Container(
               child: Padding(
                 padding: const EdgeInsets.fromLTRB(13, 180, 13, 15),
                 child: Text('This analysis contains 3 categories of test to determine your stress levels. you have to take all the 3 tests and answer the questions by analysing the situation and according to your behaviour and thoughts at that particular situation. After completing all the 3 tests the result will be obtained. ', style: TextStyle(fontSize: 23,),maxLines: 12,textAlign: TextAlign.justify,),
               )
           ),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 480, 15, 50),
                child: SizedBox(
                  height: 50,
                  width: 380,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Start()));
                    },
                    child: Text('Start Test',style: TextStyle(fontSize: 30),),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 600, 80, 0),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text('Back',style: TextStyle(fontSize: 20),),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  ),
                ),
              ),
            ),
          ],
            ),

      );

  }
}
