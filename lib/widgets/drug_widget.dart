import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:osonapteka_app/models/drug_model.dart';
import 'package:osonapteka_app/pages/drug_page.dart';
import 'package:osonapteka_app/pages/home_page_1.1.dart';

import '../utils/project_images.dart';

Widget drug(BuildContext context,Drugs product,int? indec,bool isAdmin){
  return Dismissible(
    key: UniqueKey(),
    direction: isAdmin?DismissDirection.horizontal:DismissDirection.none,
    onDismissed: (v){
      if(isAdmin==true)
      deletethis(indec??0);
    },
    background: Lottie.asset('assets/lotties/deleted.json'),
    child: InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DrugPage(product: product,)));
      },
      child: Container(
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
                      image: NetworkImage(product.imageUrl),
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
                  Text(product.name,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                  Text("${product.quantity}",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16),),
                  Row(
                    children: [
                      Text("${product.price}so'm",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.blue),),
                      Text("  dan")
                    ],
                  )
                ],
              ),
            )
          ],
        ),

      ),
    ),
  );
}

Future<void>deletethis(int index) async {
  String url = "https://pharmacy-app-management.herokuapp.com/api/drugs/$index";

  var response= await Dio().delete(url);

  if(response.statusCode==200){
    print('deleted');
    getData();
  }

}