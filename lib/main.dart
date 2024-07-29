import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internship_project/Intro_screens/intro_page1.dart';
import 'package:internship_project/Intro_screens/intro_page2.dart';
import 'package:internship_project/Intro_screens/intro_page3.dart';
import 'package:internship_project/Login.dart';
import 'package:internship_project/splash.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Splash(),
    );
  }
}

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  PageController _controller = PageController();
  bool onLasTPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Stack(
         children: [
           PageView(
             controller: _controller,
             onPageChanged: (index){
               setState(() {
                 onLasTPage = (index == 2);
               });
             },
             children: [
               IntroPage1(),
               Intropage2(),
               IntroPage3(),
             ],
           ),
           Container(
             alignment: Alignment(0,0.85),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 GestureDetector(
                     onTap: (){
                       _controller.jumpToPage(2);
                     },
                   child: Container(
                     width: 80, // Adjust the width and height to fit your needs
                     height: 40,
                     decoration: BoxDecoration(
                       color: Colors.red, // Change the color to your desired button color
                       borderRadius: BorderRadius.circular(8), // Adjust the border radius as needed
                     ),
                     child: Center(
                       child: Text(
                         'Skip',
                         style: TextStyle(
                           color: Colors.white, // Change the text color to your desired color
                           fontSize: 18,
                           fontWeight: FontWeight.bold// Adjust the font size as needed
                         ),
                       ),
                     ),
                   ),
                 ),
                 
                 SmoothPageIndicator(controller: _controller, count: 3,
                   effect: WormEffect(
                     activeDotColor: Colors.red,
                     dotColor: Colors.grey,
                   ),
                 ),

                 onLasTPage?
                 GestureDetector(
                     onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                     },
                     child: Container(
                       width: 80, // Adjust the width and height to fit your needs
                       height: 40,
                       decoration: BoxDecoration(
                         color: Colors.red, // Change the color to your desired button color
                         borderRadius: BorderRadius.circular(8), // Adjust the border radius as needed
                       ),
                       child: Center(
                         child: Text(
                           'Done',
                           style: TextStyle(
                               color: Colors.white, // Change the text color to your desired color
                               fontSize: 18,
                               fontWeight: FontWeight.bold// Adjust the font size as needed
                           ),
                         ),
                       ),
                     ),
                 ):
                 GestureDetector(
                     onTap: () {
                       _controller.nextPage(
                         duration: Duration(milliseconds: 500), curve: Curves.easeIn,);
                     },
                   child: Container(
                     width: 80, // Adjust the width and height to fit your needs
                     height: 40,
                     decoration: BoxDecoration(
                       color: Colors.red, // Change the color to your desired button color
                       borderRadius: BorderRadius.circular(8), // Adjust the border radius as needed
                     ),
                     child: Center(
                       child: Text(
                         'Next',
                         style: TextStyle(
                             color: Colors.white, // Change the text color to your desired color
                             fontSize: 18,
                             fontWeight: FontWeight.bold// Adjust the font size as needed
                         ),
                       ),
                     ),
                   ),
                 ),
               ],
             ),
           ),
         ],
       ),
    );
  }
}


