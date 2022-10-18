import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../datas/adverts_list.dart';
final controller = PageController(initialPage: 999);
Widget adverts_view(){
  return Container(
    height: 200.h,
    child: PageView.builder(
      physics: BouncingScrollPhysics(),
      controller: controller,
      itemBuilder: (context, index) =>
          Container(
            height: 180.h,
            width: 360.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                    image: AssetImage(adverts[index%4]),
                    fit: BoxFit.cover
                )
            ),
          ),),

  );
}