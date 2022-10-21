import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:osonapteka_app/widgets/drug_widget.dart';

import '../models/drug_model.dart';

class SearchPage extends StatefulWidget {
  List<Drugs>? products=[];
  List<Drugs>? searched=[];
  bool ishas=true;
  SearchPage({Key? key,required this.products}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Colors.blue,
            elevation: 0,
          )
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 80.h,
                color: Colors.blue,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 8).r,
                    height: 50.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8).r
                    ),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.search,size: 28.sp,color: Colors.grey,),
                            hintText: "Dori qidirish",
                            hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700,fontSize: 18.sp),
                            labelStyle: TextStyle(fontWeight: FontWeight.w700,fontSize: 18.sp)
                        ),
                        onChanged: (value) {
                          setState(() {
                            widget.searched=searcheds(value, widget.products);

                          });
                        },
                      ),
                    ),
                  ),
                ),

              ),
              widget.searched!.length==0?Expanded(
                  child: Container(
                    child: Lottie.asset('assets/lotties/search.json'),
                  )):
              Expanded(
                child: ListView.builder(
                  itemCount: widget.searched!.length,
                  shrinkWrap: true,
                    itemBuilder: (context, index) =>drug(context, widget.searched![index],index)),
              )
            ],
          ),
        ),

      ),

    );
  }
}
List<Drugs> searcheds(String nameOfProduct,List<Drugs>? database){
  List<Drugs> found_product=[];
  for(var i in database!){
    if(i.name.toLowerCase().contains(nameOfProduct.toLowerCase())){
      found_product.add(i);
    }
  }
  return found_product;

}