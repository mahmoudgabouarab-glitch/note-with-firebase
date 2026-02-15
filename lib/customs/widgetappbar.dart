import 'package:flutter/material.dart';

class AppBarCustom extends AppBar {
  AppBarCustom({
    super.key,
    required BuildContext context,
    String? titleText,
    bool showBack = true,
    List<Widget>? actions,
    
  }) : super(
         toolbarHeight: 78,
         title: Text(
           titleText ?? '',
           style: const TextStyle(
             color: Color(0xff232440),
             fontSize: 27,
             height: 28,
           ),
         ),
         backgroundColor: Color(0xffFFFFFF),
         elevation: 0,
         centerTitle: true,
         leading: showBack
             ? IconButton(
                 icon: Image.asset('image/back.png', width: 24, height: 24),
                 onPressed: () => Navigator.pop(context),
               )
             : null,
         actions: actions,
       );
}
