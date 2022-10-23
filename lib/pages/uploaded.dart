import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:osonapteka_app/pages/home_page_1.1.dart';

class Uploaded extends StatefulWidget {
  const Uploaded({Key? key}) : super(key: key);

  @override
  State<Uploaded> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<Uploaded> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomePage())));
    return Scaffold(
      body: Center(child: Lottie.asset('assets/lotties/uploaded.json')),
    );
  }
}
