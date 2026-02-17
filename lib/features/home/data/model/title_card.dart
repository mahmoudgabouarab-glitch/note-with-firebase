import 'package:flutter/material.dart';
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
  TitleCard({required this.title, required this.icon, required this.screen});
}

List<TitleCard> titleCard = [
  TitleCard(
    title: "Personal Note",
    icon: Icons.note_alt_outlined,
    screen: PresonalNoteView(),
  ),
  TitleCard(
    title: "Business Note",
    icon: Icons.note_outlined,
    screen: BusinessNoteView(),
  ),
  TitleCard(
    title: "Family Note",
    icon: Icons.note_add_outlined,
    screen: FamilyNoteView(),
  ),
  TitleCard(
    title: "Work Note",
    icon: Icons.note_rounded,
    screen: WorkNoteView(),
  ),
  TitleCard(
    title: "Academic Note",
    icon: Icons.note_rounded,
    screen: AcademicNoteView(),
  ),
  TitleCard(
    title: "Others Note",
    icon: Icons.note_rounded,
    screen: OthersNoteView(),
  ),
];
