import 'package:flutter/material.dart';

class Intropage2 extends StatelessWidget {
  const Intropage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(30, 130, 30, 20),
          child: Image.asset('assets/level.png',width: 250,height: 250,),
        ),
        Padding(
          padding:  EdgeInsets.fromLTRB(30, 0, 30, 20),
          child: Center(child: Text('To live a healthy and peaceful life keep a check on your stress levels...',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),maxLines: 4,textAlign: TextAlign.center,)),
        ),

      ],
    );
  }
}
