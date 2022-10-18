import 'package:flutter/material.dart';
import 'package:osonapteka_app/pages/home_page_1.1.dart';

import '../utils/project_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4)).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage())));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(bottom: 70),
          color: Colors.white,
          child: Center(
            child: Image.asset(Images.splash_photo),
          ),
        ),
      ),
    );
  }
}
