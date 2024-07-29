import 'package:flutter/material.dart';
import 'package:internship_project/Test.dart';
import 'package:internship_project/epworth.dart';
import 'package:internship_project/gad.dart';
import 'package:internship_project/phq.dart';



class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(child: Text('TEST ANALYSIS',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)),
                  SizedBox(height: 80.0),
                  SizedBox(
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => gad()));
                      },
                      child: Text('Anxiety Test ',style: TextStyle(fontSize: 23  ),maxLines: 2,),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  SizedBox(
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => epworth()));
                      },
                      child: Text('Daytime Sleepiness Test ',style: TextStyle(fontSize: 23),maxLines: 2,textAlign: TextAlign.center,),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  SizedBox(
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => phq()));
                      },
                      child: Text('Depression Test ',style: TextStyle(fontSize: 23,),maxLines: 2,),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 650, 80, 0),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TestPage()));
                },
                child: Text('Back',style: TextStyle(fontSize: 20),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
              ),
            ),
          ),
      ]
      ),
    );
  }
}
