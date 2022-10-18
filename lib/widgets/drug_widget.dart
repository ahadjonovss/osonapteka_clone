import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/project_images.dart';

Widget drug(){
  return Container(
    margin: EdgeInsets.only(bottom: 16),
    padding: EdgeInsets.all(10).r,
    height:90.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8).r,
        color: Colors.grey.withOpacity(0.10)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 70.h,
          width: 70.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8).r,
              image: DecorationImage(
                  image: AssetImage(Images.fourth_add),
                  fit: BoxFit.cover
              )
          ),
        ),
        Container(
          width: 250.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Parasetamol",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
              Text("300 gr",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16),),
              Row(
                children: [
                  Text("100.000 so'm",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.blue),),
                  Text("  dan")
                ],
              )
            ],
          ),
        )
      ],
    ),

  );
}