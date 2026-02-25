import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:onlyproject/core/network/constant_collection_fb.dart';
import 'package:onlyproject/features/home/presentation/view/widget/details_category/academic_note/academic_note_view.dart';
import 'package:onlyproject/features/home/presentation/view/widget/details_category/business_note/business_note_view.dart';
import 'package:onlyproject/features/home/presentation/view/widget/details_category/family_note/family_note_view.dart';
import 'package:onlyproject/features/home/presentation/view/widget/details_category/others_note/others_note_view.dart';
import 'package:onlyproject/features/home/presentation/view/widget/details_category/presonal_note/presonal_note_view.dart';
import 'package:onlyproject/features/home/presentation/view/widget/details_category/work_note/work_note_view.dart';
import 'package:onlyproject/generated/locale_keys.g.dart';

class TitleCard {
  String title;
  IconData icon;
  Widget screen;
  String cPath;
  String docPath;
  TitleCard({
    required this.title,
    required this.icon,
    required this.screen,
    required this.cPath,
    required this.docPath,
  });
}

List<TitleCard> get titleCard => [
  TitleCard(
    title: LocaleKeys.personal_note.tr(),
    icon: Icons.person_outline_sharp,
    screen: PresonalNoteView(),
    cPath: FB.cPresonal,
    docPath: FB.dPresonal,
  ),
  TitleCard(
    title: LocaleKeys.business_note.tr(),
    icon: Icons.attach_money,
    screen: BusinessNoteView(),
    cPath: FB.cBusiness,
    docPath: FB.dBusiness,
  ),
  TitleCard(
    title: LocaleKeys.family_note.tr(),
    icon: Icons.family_restroom_outlined,
    screen: FamilyNoteView(),
    cPath: FB.cFamily,
    docPath: FB.dFamily,
  ),
  TitleCard(
    title: LocaleKeys.work_note.tr(),
    icon: Icons.work_outline,
    screen: WorkNoteView(),
    cPath: FB.cWork,
    docPath: FB.dWork,
  ),
  TitleCard(
    title: LocaleKeys.academic_note.tr(),
    icon: Icons.school_outlined,
    screen: AcademicNoteView(),
    cPath: FB.cAcademic,
    docPath: FB.dAcademic,
  ),
  TitleCard(
    title: LocaleKeys.others_note.tr(),
    icon: Icons.note_alt_outlined,
    screen: OthersNoteView(),
    cPath: FB.cOthers,
    docPath: FB.dOthers,
  ),
];
