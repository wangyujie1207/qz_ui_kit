import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<Result> cityPicker(BuildContext context) async {
  return await CityPickers.showCityPicker(
      context: context,
      height: 580.w,
      showType: ShowType.pca,
      itemExtent: 74.w,
      locationCode: '310106',
      cancelWidget: Text(
        '取消',
        style: TextStyle(color: const Color(0xFF9B9B9B), fontSize: 34.sp),
      ),
      confirmWidget: Text(
        '确认',
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 34.sp),
      ),
      itemBuilder: (dynamic item, List<dynamic> list, int index) {
        return Center(
          child: Text(
            item,
            style: TextStyle(
                color: const Color(0xFF2E2E2E), fontSize: 32.sp, fontWeight: FontWeight.bold),
          ),
        );
      });
}
