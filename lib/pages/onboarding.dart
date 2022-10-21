import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 200.h,),
                  Container(
                    height: 200.w,
                    child: Lottie.asset('assets/lotties/onboarding_1.json'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20).r,
                    child: Center(child: Text("Izlang, tanlang\nva online buyurtma bering",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),)),
                  ),
                  Container(
                    width: 300.w,
                    margin: EdgeInsets.only(top: 20).r,
                    child: Text(
                      "O'zingizga kerakli bo'lgan dori vositalarini masofadan turib qidirish va xarid qilish imkoniyati",
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300,color: Colors.grey),
                      textAlign: TextAlign.center ,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),

    );
  }
}
