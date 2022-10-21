import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

List<Widget> onboardings=[
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
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(height: 100.h,),
      Container(
        height: 200.w,
        child: Lottie.asset('assets/lotties/onboarding_2.json',fit: BoxFit.cover,width: 300.w),
      ),
      Container(
        margin: EdgeInsets.only(top: 140).r,
        child: Center(child: Text("Malakali operatorlar\nbilan suhbat",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),)),
      ),
      Container(
        width: 300.w,
        margin: EdgeInsets.only(top: 20).r,
        child: Text(
          "Dori vositalari qo'llanmasi haqida malakali xodimlar tomonidan bepul konsultatsiya",
          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300,color: Colors.grey),
          textAlign: TextAlign.center ,
        ),
      )
    ],
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 200.h,
        width: 400.w,
        child: Lottie.asset('assets/lotties/onboarding_3.json',width: 400,fit: BoxFit.cover),
      ),
      Container(
        margin: EdgeInsets.only(top: 230).r,
        child: Center(child: Text("Sifatli va tezkor\nyetkazib berish",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),)),
      ),
      Container(
        width: 300.w,
        margin: EdgeInsets.only(top: 20).r,
        child: Text(
          "Buyurtma qilgan mahsulotlaringizni qisqa vaqtda sifatli holatda yetkazib berish xizmati",
          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300,color: Colors.grey),
          textAlign: TextAlign.center ,
        ),
      )
    ],
  ),
];

Widget Onboarding(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 200.h,
        width: 400.w,
        child: Lottie.asset('assets/lotties/onboarding_3.json',width: 400,fit: BoxFit.cover),
      ),
      Container(
        margin: EdgeInsets.only(top: 230).r,
        child: Center(child: Text("Sifatli va tezkor\nyetkazib berish",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),)),
      ),
      Container(
        width: 300.w,
        margin: EdgeInsets.only(top: 20).r,
        child: Text(
          "Buyurtma qilgan mahsulotlaringizni qisqa vaqtda sifatli holatda yetkazib berish xizmati",
          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300,color: Colors.grey),
          textAlign: TextAlign.center ,
        ),
      )
    ],
  );
}