import 'package:flutter/material.dart';
import 'package:onlyproject/features/home/presentation/view/widget/details_category/academic_note.dart';
import 'package:onlyproject/features/home/presentation/view/widget/details_category/business_note.dart';
import 'package:onlyproject/features/home/presentation/view/widget/details_category/family_note.dart';
import 'package:onlyproject/features/home/presentation/view/widget/details_category/others_note.dart';
import 'package:onlyproject/features/home/presentation/view/widget/details_category/presonal_note.dart';
import 'package:onlyproject/features/home/presentation/view/widget/details_category/work_note.dart';

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
    screen: PresonalNote(),
  ),
  TitleCard(
    title: "Business Note",
    icon: Icons.note_outlined,
    screen: BusinessNote(),
  ),
  TitleCard(
    title: "Family Note",
    icon: Icons.note_add_outlined,
    screen: FamilyNote(),
  ),
  TitleCard(title: "Work Note", icon: Icons.note_rounded, screen: WorkNote()),
  TitleCard(
    title: "Academic Note",
    icon: Icons.note_rounded,
    screen: AcademicNote(),
  ),
  TitleCard(
    title: "Others Note",
    icon: Icons.note_rounded,
    screen: OthersNote(),
  ),
];
