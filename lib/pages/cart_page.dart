import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osonapteka_app/models/drug_model.dart';
import 'package:osonapteka_app/widgets/drug_buy_widget.dart';
import 'package:osonapteka_app/widgets/drug_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
 Drugs product=Drugs(name: "name", price: 2300, description: "description", id: 1, imageUrl: "https://source.unsplash.com/random", quantity: 200);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: (){Navigator.pop(context);},
            child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        title: Text("Sizning savatingiz",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w700),),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.r),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tanlangan dorilar soni: 2",
            style: TextStyle(color: Colors.grey,fontSize: 16.sp,fontWeight: FontWeight.w600),
        ),
                  Text("Yana qo'shish+",style: TextStyle(color: Colors.blue,fontSize: 16.sp,fontWeight: FontWeight.w600),
        )
                ],
              ),
              drug_cart(context, product),
              Container(
                width: 350.w,
                padding: EdgeInsets.all(20).r,
                child: Column(
                  children: [
                    Text("To'lov tafsilotlari",style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.w600)),
                      SizedBox(height: 12.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Umumiy narx:",style: TextStyle(color: Colors.grey,fontSize: 16.sp,fontWeight: FontWeight.w600),),
                          Text("1234355 so'm",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w600),),


                        ],
                      ),
                    SizedBox(height: 12.h,),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Chegirma::",style: TextStyle(color: Colors.grey,fontSize: 16.sp,fontWeight: FontWeight.w600),),
                        Text("1234355 so'm",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w600),),


                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Promo kod chegirmasi",style: TextStyle(color: Colors.grey,fontSize: 16.sp,fontWeight: FontWeight.w600),),
                        Text("1234355 so'm",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w600),),


                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Xizmat ko'rsatish",style: TextStyle(color: Colors.grey,fontSize: 16.sp,fontWeight: FontWeight.w600),),
                        Text("1234355 so'm",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w600),),


                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,

                    ),
                    SizedBox(height: 12.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Xizmat ko'rsatish",style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.w600),),
                        Text("1234355 so'm",style: TextStyle(color: Colors.black,fontSize: 19.sp,fontWeight: FontWeight.w600),),


                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20).r,
                      ),
                      child: Center(
                        child: Text("Xarid qilish",style: TextStyle(color: Colors.
                            white,fontSize: 19.sp,fontWeight: FontWeight.w600),),
                      ),
                    )
                  ],
                ),
              ), //oplata
            ],
          ),
        ),
      ),
    );
  }
}
