import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:osonapteka_app/routes/routes.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: [
          SizedBox(height: 130.h,),
          Container(
            width: 400.w,
            height: 250.h,
            child: FittedBox(
              child: Lottie.asset("assets/lotties/welcome.json"),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30).r,
            child: const Center(child: Text("Oson Aptekaga Xush kelibsiz!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),)),
          ),
          Container(
            width: 300.w,
            margin: const EdgeInsets.only(top: 20).r,
            child: const Text(
              "Yanada sog'lom hayotda yashashga tayyormisiz?",
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300,color: Colors.grey),
              textAlign: TextAlign.center ,
            ),
          ),
          SizedBox(height: 20.h,),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28).r
                )

              )
            ),
              onPressed: (){
                Navigator.pushNamed(context, RouteName.create_account);
              },
              child: SizedBox(
                width: 300.w,
                height: 55.h,
                child: Center(
                  child: Text(
                    "Sign up with email",style: TextStyle(fontSize: 18.sp,color: Colors.white),
                  ),
                ),

              )),
          SizedBox(height: 20.h,),
          button(context,"Continue with Facebook" , Icon(Icons.facebook,color: Colors.blue,size: 32.sp,),),
          SizedBox(height: 20.h,),
          button(context,"Continue with Telegram" , Icon(Icons.telegram,color: Colors.blue,size: 32.sp,),),
          SizedBox(height: 12.h,),
          TextButton(onPressed: (){Navigator.pushNamed(context,RouteName.loginPage);}, child: Text("Login",style: TextStyle(color: Colors.grey.withOpacity(0.5),fontSize: 20.sp,fontWeight: FontWeight.normal),))


        ],
      ),
    );
  }
}

Widget button(BuildContext context,String text, Icon icon){
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24).r),
          side: BorderSide(color: Colors.grey.withOpacity(0.4))
      ),
      onPressed: (){
        var snackBar =  const SnackBar(
            duration: Duration(milliseconds: 700),
            content: Text('Hozirda ushbu imkoniyat mavjud emas!',style: TextStyle(color: Colors.white),));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: SizedBox(
          width: 300.w,
          height: 55.h,
          child:Container(
            width: 200,
            margin: EdgeInsets.only(left: 40,right: 40).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                icon,
                Text(text,style: TextStyle(color: Colors.indigoAccent,fontSize: 16.sp),)
              ],
            ),
          )

      ));
}

