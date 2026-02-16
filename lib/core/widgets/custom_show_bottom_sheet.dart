import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlyproject/core/utils/app_color.dart';
import 'package:onlyproject/core/utils/speacing.dart';
import 'package:onlyproject/core/widgets/custom_button.dart';
import 'package:onlyproject/core/widgets/custom_text_filed.dart';

class CustomShowBottomSheet {
  static Future<T?> show<T>({
    required BuildContext context,
    void Function()? ontap,
  }) {
    return showModalBottomSheet<T?>(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.40,
          child: Column(
            children: [
              spaceH(8),
              Center(
                child: Container(
                  width: 64.w,
                  height: 4.h,
                  color: AppColor.primary,
                ),
              ),
              spaceH(20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("title"),
                      spaceH(8),
                      CustomTextFiled(hint: "title"),
                      spaceH(20),
                      Text("subtitle"),
                      spaceH(8),
                      CustomTextFiled(hint: "subtitle"),
                      spaceH(30),
                      Center(
                        child: SizedBox(
                          width: 150.w,
                          child: Btn(ontap: ontap, text: "Add"),
                        ),
                      ),
                      spaceH(30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
