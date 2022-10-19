import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:osonapteka_app/datas/my_cart.dart';
import 'package:osonapteka_app/models/drug_model.dart';
import 'package:osonapteka_app/models/purchase.dart';
import 'package:osonapteka_app/pages/home_page_1.1.dart';
import 'package:osonapteka_app/pages/search_page.dart';
import 'package:osonapteka_app/pages/success_purchase_page.dart';

import 'drug_page.dart';

class CartPage extends StatefulWidget {
  Purchase myData=Purchase(my_cart);
   CartPage({Key? key}) : super(key: key);

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
                  Text("Tanlangan dorilar soni: ${my_cart.length}",
            style: TextStyle(color: Colors.grey,fontSize: 16.sp,fontWeight: FontWeight.w600),
        ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                    },
                    child: Text("Yana qo'shish+",style: TextStyle(color: Colors.blue,fontSize: 16.sp,fontWeight: FontWeight.w600),
        ),
                  )
                ],
              ),
              Expanded(
                child: my_cart.isEmpty?Lottie.asset('assets/lotties/cart_empty.json'):ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: my_cart.length??0,
                    itemBuilder: (context, index) => InkWell(
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
                                      image: NetworkImage(my_cart.elementAt(index).imageUrl),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(my_cart.elementAt(index).name,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                                  Text("${my_cart.elementAt(index).quantity}",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16),),
                                  Row(
                                    children: [
                                      Text("${my_cart.elementAt(index).price}so'm",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.blue),),
                                      Text("  dan")
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                      child: Icon(Icons.cancel,color: Colors.grey,),
                                    onTap: (){
                                        my_cart.remove(my_cart.elementAt(index));
                                        setState(() {});
                                    },
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        child: Icon(Icons.add_circle_outline),
                                        onTap: (){
                                          my_cart.elementAt(index).count++;
                                          setState(() {});
                                        },
                                      ),
                                      Text("${my_cart.elementAt(index).count}"),
                                      InkWell(
                                        child: Icon(Icons.remove_circle_outline),
                                        onTap: (){
                                          if(my_cart.elementAt(index).count==1){
                                            setState(() {
                                              my_cart.remove(my_cart.elementAt(index));

                                            });
                                          }
                                          if(my_cart.elementAt(index).count!=0)
                                            {
                                              my_cart.elementAt(index).count--;
                                            }

                                          setState(() {});
                                        },
                                      )

                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),

                      ),
                    )),
              ),
              InkWell(
                onTap: (){
                  if(my_cart.length>0){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>PurchasePage()));
                    my_cart.clear();
                  }

                  else{
                    var snackBar = SnackBar(
                        duration: Duration(milliseconds: 800),
                        content: Text("Xarid qilish uchun mahsulot topilmadi!"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }

                },
                child: Container(
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
                            Text("${widget.myData.getcost()} so'm",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w600),),


                          ],
                        ),
                      SizedBox(height: 12.h,),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Chegirma::",style: TextStyle(color: Colors.grey,fontSize: 16.sp,fontWeight: FontWeight.w600),),
                          Text("${widget.myData.getDiscount()} so'm",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w600),),


                        ],
                      ),
                      SizedBox(height: 12.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Promo kod chegirmasi",style: TextStyle(color: Colors.grey,fontSize: 16.sp,fontWeight: FontWeight.w600),),
                          Text("${widget.myData.promo_code} so'm",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w600),),


                        ],
                      ),
                      SizedBox(height: 12.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Xizmat ko'rsatish",style: TextStyle(color: Colors.grey,fontSize: 16.sp,fontWeight: FontWeight.w600),),
                          Text("${widget.myData.service} so'm",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w600),),


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
                          Text("Umumiy",style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.w600),),
                          Text("${widget.myData.getAllCost()} so'm",style: TextStyle(color: Colors.black,fontSize: 19.sp,fontWeight: FontWeight.w600),),


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
                ),
              ), //oplata
            ],
          ),
        ),
      ),
    );
  }
}

Widget drug_cart(BuildContext context,Drugs product,){
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
                    InkWell(
                      child: Icon(Icons.add_circle_outline),
                      onTap: (){
                        product.count++;
                      },
                    ),
                    Text("${product.count}"),
                    InkWell(
                      child: Icon(Icons.remove_circle_outline),
                      onTap: (){
                        if(product.count!=0)
                          product.count--;
                      },
                    )

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