import 'package:flutter/material.dart';
import 'package:onlyproject/features/home/presentation/view/widget/detailsitem/academic_note.dart';
import 'package:onlyproject/features/home/presentation/view/widget/detailsitem/business_note.dart';
import 'package:onlyproject/features/home/presentation/view/widget/detailsitem/family_note.dart';
import 'package:onlyproject/features/home/presentation/view/widget/detailsitem/others_note.dart';
import 'package:onlyproject/features/home/presentation/view/widget/detailsitem/presonal_note.dart';
import 'package:onlyproject/features/home/presentation/view/widget/detailsitem/work_note.dart';

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
