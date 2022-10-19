import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osonapteka_app/models/drug_model.dart';
import 'package:osonapteka_app/pages/drug_page.dart';

import '../utils/project_images.dart';

Widget drug_cart(BuildContext context,Drugs product){
  return InkWell(
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
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.cancel,color: Colors.grey,),
                Row(
                  children: [
                    Icon(Icons.add_circle_outline),
                    Text("son"),
                    Icon(Icons.remove_circle_outline)

                  ],
                )
              ],
            ),
          )
        ],
      ),

    ),
  );
}