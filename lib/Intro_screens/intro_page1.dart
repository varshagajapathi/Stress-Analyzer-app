import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(30, 130, 30, 20),
          child: Image.asset('assets/stress.png',width: 250,height: 250,),
        ),
        Padding(
          padding:  EdgeInsets.fromLTRB(30, 0, 30, 20),
          child: Center(child: Text('Stress is common for everyone in modern generation, but prolongation of stress can be harmful...',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),maxLines: 4,textAlign: TextAlign.center,)),
        ),

      ],
    );
  }
}
