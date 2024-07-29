import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(30, 130, 30, 20),
          child: Image.asset('assets/save.png',width: 250,height: 250,),
        ),
        Padding(
          padding:  EdgeInsets.fromLTRB(30, 0, 30, 20),
          child: Center(child: Text('Prolongation of stress can be fatal so record your stress status and lead a healthy life...',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),maxLines: 4,textAlign: TextAlign.center,)),
        ),


      ],
    );
  }
}
