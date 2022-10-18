import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../models/drug_model.dart';

class DrugPage extends StatefulWidget {
  Drugs product;
  bool malumot=true;
  bool analog=false;
  DrugPage({Key? key,required this.product}) : super(key: key);

  @override
  State<DrugPage> createState() => _DrugPageState();
}

class _DrugPageState extends State<DrugPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: (){Navigator.pop(context);},
            child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        centerTitle: true,
        title: Text("Tavsif",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w700),),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20.r),
            child: Column(
              children: [
                Container(
                  height: 200.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.product.imageUrl),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                SizedBox(height: 20.h,),
                Center(
                  child: Text(widget.product.name,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w700),),
                ),
                SizedBox(height: 20.h,),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${widget.product.price}so'm",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.blue),),
                      Text("  dan")
                    ],
                  ),
                ),
                SizedBox(height: 20.h,),
                Container(
                  padding: EdgeInsets.all(4).r,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8).r,
                    color: Colors.grey.withOpacity(0.3)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Container(
                          width: 170.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4).r,
                            color: widget.malumot?Colors.white:Colors.grey.withOpacity(0.3)
                          ),
                          child: Center(child: Text("Ma'lumot")),
                        ),
                        onTap: (){
                          setState(() {
                            widget.malumot=!widget.malumot;
                          });
                        },
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            widget.malumot=!widget.malumot;
                          });
                        },
                        child: Container(
                          width: 170.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4).r,
                              color: widget.malumot?Colors.grey.withOpacity(0.3):Colors.white,
                          ),
                          child: Center(child: Text("Analog")),
                        ),
                      )

                    ],
                  ),
                ),
                SizedBox(height: 20.h,),
                widget.malumot?Container(
                  padding: EdgeInsets.all(20.r),
                  width: 400.w,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nomi",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),),
                      SizedBox(height: 8.h,),
                      Text(widget.product.name,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16.sp),),
                      SizedBox(height: 8.h,),
                      Text("Miqdori",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),),
                      SizedBox(height: 8.h,),
                      Text("${widget.product.quantity} gramm",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16.sp)),
                      SizedBox(height: 8.h,),
                      Text("Qo'llanilishi",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),),
                      SizedBox(height: 8.h,),
                      Text(widget.product.description,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16.sp),),


                    ],
                  ),

                ):Container(height: 300.h,
                child: Lottie.asset('assets/lotties/nodata.json'),)
              ],
            ),
          ),
        ),
      ),

    );
  }
}
