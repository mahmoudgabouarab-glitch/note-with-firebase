import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlyproject/core/utils/app_assets.dart';
import 'package:onlyproject/core/utils/app_color.dart';
import 'package:onlyproject/core/utils/app_styles.dart';
import 'package:onlyproject/core/utils/function.dart';
import 'package:onlyproject/core/utils/speacing.dart';
import 'package:onlyproject/features/home/data/model/title_card.dart';
import 'package:onlyproject/generated/locale_keys.g.dart';

class OneItemOfCard extends StatelessWidget {
  final TitleCard titleCard;
  final int state;
  const OneItemOfCard({
    super.key,
    required this.titleCard,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            isArabic(context) ? AppAssets.homecarda : AppAssets.homecarde,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20.h,
            left: isArabic(context) ? null : 20.w,
            right: isArabic(context) ? 20.w : null,
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
                Text(titleCard.title, style: Styles.s16_600),
                spaceH(5),
                Text(
                  "${state.toString()} ${LocaleKeys.note_count.tr()}",
                  style: Styles.s14_600,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
