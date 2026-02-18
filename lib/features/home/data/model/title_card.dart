import 'package:flutter/material.dart';
import 'package:onlyproject/core/network/constant_collection_fb.dart';
import 'package:onlyproject/features/home/presentation/view/widget/details_category/academic_note/academic_note_view.dart';
import 'package:onlyproject/features/home/presentation/view/widget/details_category/business_note/business_note_view.dart';
import 'package:onlyproject/features/home/presentation/view/widget/details_category/family_note/family_note_view.dart';
import 'package:onlyproject/features/home/presentation/view/widget/details_category/others_note/others_note_view.dart';
import 'package:onlyproject/features/home/presentation/view/widget/details_category/presonal_note/presonal_note_view.dart';
import 'package:onlyproject/features/home/presentation/view/widget/details_category/work_note/work_note_view.dart';

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

List<TitleCard> titleCard = [
  TitleCard(
    title: "Personal Note",
    icon: Icons.note_alt_outlined,
    screen: PresonalNoteView(),
    cPath: FB.cPresonal,
    docPath: FB.dPresonal,
  ),
  TitleCard(
    title: "Business Note",
    icon: Icons.note_outlined,
    screen: BusinessNoteView(),
    cPath: FB.cBusiness,
    docPath: FB.dBusiness,
  ),
  TitleCard(
    title: "Family Note",
    icon: Icons.note_add_outlined,
    screen: FamilyNoteView(),
    cPath: FB.cFamily,
    docPath: FB.dFamily,
  ),
  TitleCard(
    title: "Work Note",
    icon: Icons.note_rounded,
    screen: WorkNoteView(),
    cPath: FB.cWork,
    docPath: FB.dWork,
  ),
  TitleCard(
    title: "Academic Note",
    icon: Icons.note_rounded,
    screen: AcademicNoteView(),
    cPath: FB.cAcademic,
    docPath: FB.dAcademic,
  ),
  TitleCard(
    title: "Others Note",
    icon: Icons.note_rounded,
    screen: OthersNoteView(),
    cPath: FB.cOthers,
    docPath: FB.dOthers,
  ),
];
