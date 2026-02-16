import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlyproject/core/utils/app_assets.dart';
import 'package:onlyproject/core/utils/app_color.dart';
import 'package:onlyproject/core/utils/speacing.dart';
import 'package:onlyproject/features/home/data/model/title_card.dart';

class OneItemOfCard extends StatelessWidget {
  final TitleCard titleCard;
  const OneItemOfCard({super.key, required this.titleCard});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.homecard),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20.h,
            left: 20.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: AppColor.textSubTitle.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(titleCard.icon, color: AppColor.primary),
                  ),
                ),
                spaceH(10),
                Text(titleCard.title),
                spaceH(5),
                Text("30 Notes"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
