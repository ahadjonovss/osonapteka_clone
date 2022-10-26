import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osonapteka_app/datas/shared_preference.dart';

import '../routes/routes.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController name1Controller =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: 800.h,
            padding: const EdgeInsets.only(left:4,top: 16,right: 12).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: (){Navigator.pop(context);},
                  icon: Icon(Icons.arrow_back_ios),
                ),
                Container(
                  width: 400.w,
                  margin: const EdgeInsets.all(20).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Create Your Account",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24.sp),),
                      SizedBox(height: 30.h,),
                      Container(
                        width: 400.w,
                        child: TextField(
                          controller: name1Controller,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person_outline),
                              hintText: "Your name",
                              hintStyle: TextStyle(fontSize: 16.sp)

                          ),

                        ),
                      ),//name
                      SizedBox(height: 30.h,),
                      Container(
                        width: 400.w,
                        child: TextField(
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.phone_iphone),
                              hintText: "Your Number",
                              hintStyle: TextStyle(fontSize: 16.sp)

                          ),
                        ),
                      ),//phone
                      SizedBox(height: 30.h,),
                      Container(
                        width: 400.w,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.phone_iphone),
                              hintText: "Email Address",
                              hintStyle: TextStyle(fontSize: 16.sp)

                          ),
                        ),
                      ),
                      SizedBox(height: 30.h,),
                      Container(
                        width: 400.w,
                        child: TextField(
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.phone_iphone),
                              hintText: "Password",
                              hintStyle: TextStyle(fontSize: 16.sp)

                          ),
                        ),
                      ),
                      SizedBox(height: 30.h,),
                      ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28).r
                                  )

                              )
                          ),
                          onPressed: () async {
                            if(name1Controller.text.isNotEmpty){
                              await StorageRepository.saveString('name', name1Controller.text);
                              Navigator.pushReplacementNamed(context, RouteName.purchase);
                            }
                            else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Iltimos, ism yoki usernameni kiriting")));
                            }
                          },
                          child: SizedBox(
                            width: 250.w,
                            height: 50.h,
                            child: Center(
                              child: Text(
                                "Create Account",style: TextStyle(fontSize: 18.sp,color: Colors.white),
                              ),
                            ),

                          )),
                      TextButton(onPressed: (){Navigator.pushNamed(context,RouteName.loginPage);}, child: Text("Already have an account? Login",style: TextStyle(color: Colors.grey.withOpacity(0.5),fontSize: 16.sp,fontWeight: FontWeight.normal),))

                    ],
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
