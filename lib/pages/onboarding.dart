import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:osonapteka_app/datas/onboardings.dart';
import 'package:osonapteka_app/datas/shared_preference.dart';
import 'package:osonapteka_app/pages/home_page_1.1.dart';
import 'package:osonapteka_app/widgets/advert_widget.dart';

class Onboarding extends StatefulWidget {
   Onboarding({Key? key}) : super(key: key);
  int currentPage=0;

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 720.h,
                width: 400.w,
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 3,
                  onPageChanged: (val){
                    widget.currentPage=val;
                    setState(() {

                    });

                  },
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => onboardings[widget.currentPage],),
              ),
              Container(
                width: 400.w,
                margin: EdgeInsets.all(20).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Skip",style: TextStyle(color: Colors.grey,fontSize: 18),),
                    DotsIndicator(
                        dotsCount: 3,
                      position: widget.currentPage.toDouble(),
                      decorator: DotsDecorator(
                        size: const Size.square(9.0),
                        activeSize: const Size(18.0, 9.0),
                        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        if(widget.currentPage==2){
                          StorageRepository.saveBool("Login", true);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomePage()));
                        }
                        if(widget.currentPage!=2)
                        widget.currentPage++;
                        setState(() {

                        });
                      },
                        child: Text("Next",style: TextStyle(color: Colors.blue,fontSize: 18)))
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
