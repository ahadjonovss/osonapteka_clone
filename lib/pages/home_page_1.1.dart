import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:osonapteka_app/pages/search_page.dart';
import 'package:osonapteka_app/widgets/drug_widget.dart';

import '../models/drug_model.dart';
import '../utils/project_images.dart';
import '../widgets/advert_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<List<Drugs>> getData() async {
  var dio = Dio();
  List list=[];
  final response = await dio.get('https://pharmacy-app-management.herokuapp.com/api/drugs');
  if(response.statusCode==200){
    list=response.data;
    return list.map((e) => Drugs.fromJson(e)).toList();
  }
  else
    return List.empty();

}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: _key,
      backgroundColor: Colors.blue,
      endDrawer: Drawer(),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<Drugs>? all_drugs=snapshot.data;
            return SafeArea(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20).r,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Qidiruvni boshlash",
                                  style: TextStyle(color: Colors.white,fontSize: 24.sp,fontWeight: FontWeight.w600),),
                                InkWell(
                                    onTap: () {
                                      _key.currentState!.openEndDrawer();
                                    },
                                    child:  Icon(Icons.menu,color: Colors.white,size: 32.sp,))
                              ],
                            ), //Qidiruvni boshlash
                            SizedBox(height: 12.h,),
                            InkWell(
                              onTap: ()=>Navigator.pop(context),
                              child: Row(
                                children:  [
                                  Text("Tumanni tanlash", style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.w600),),
                                  Icon(Icons.navigate_next,color: Colors.white,size: 20.sp,)
                                ],
                              ),
                            ), //Tumanni tanlash
                            SizedBox(height: 20.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage(products: all_drugs,)));
                                  },
                                  child: Container(
                                      padding: EdgeInsets.only(left: 8).r,
                                      height: 50.h,
                                      width: 280.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(8).r
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.search,size: 28.sp,color: Colors.grey,),
                                          Text("Dori qidirish",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700,fontSize: 18.sp),)
                                        ],
                                      )
                                  ),
                                ),
                                Container(
                                  height: 50.h,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8).r
                                  ),
                                  child: Icon(Icons.qr_code,size: 32.sp,color: Colors.grey,),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20).r,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              adverts_view(),
                              SizedBox(height: 16.h,),
                              Text("Ommabop qidiruvlar",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600),),
                              SizedBox(height: 12.h,),
                              Expanded(
                                child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: all_drugs?.length??0,
                                  itemBuilder: (context, index) => drug(context,all_drugs![index]),),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),

                ));
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return Container(
              color: Colors.white,
              child: Center(
                child: Lottie.asset('assets/lotties/waiting.json'),
              ),
            );
          }
          return Container();

        } ,
      )

    );
  }
}
