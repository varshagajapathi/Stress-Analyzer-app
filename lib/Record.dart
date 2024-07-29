import 'package:flutter/material.dart';
import 'package:internship_project/home.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
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
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 760, 80, 0),
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
          ]
      ),
    );
  }
}
