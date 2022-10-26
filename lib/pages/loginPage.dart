import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osonapteka_app/datas/shared_preference.dart';

import '../routes/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController =  TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                height: 400.h,
                margin: const EdgeInsets.all(20).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Welcome Back!",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24.sp),),
                    SizedBox(height: 30.h,),
                    Container(
                      width: 400.w,
                      child: TextField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_outline),
                            hintText: "Username",
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
                            prefixIcon: Icon(Icons.lock),
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
                        onPressed: (){
                          if(nameController.text.isNotEmpty){
                            StorageRepository.saveString('name', nameController.text);
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
                              "Login",style: TextStyle(fontSize: 18.sp,color: Colors.white),
                            ),
                          ),

                        )),
                    // SizedBox(height:110.h),
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context,RouteName.welcomepage);}, child: Text("Don't have an account? Sign Up",style: TextStyle(color: Colors.grey.withOpacity(0.5),fontSize: 16.sp,fontWeight: FontWeight.normal),))

                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
