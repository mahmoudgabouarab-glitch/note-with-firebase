import 'package:flutter/material.dart';

import 'widgetappbar.dart';

class BaseScreen extends StatefulWidget {
  final String? title;
  final Widget? drawer;
  final Widget body;
  final FloatingActionButton?floatingActionButton;
  final List<Widget>? action;
  final bool showBack;
  

  const BaseScreen({super.key, this.title, this.drawer, required this.body, this.floatingActionButton, this.action,  this.showBack=true,  });

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.title != null
          ? AppBarCustom(context: context, titleText: widget.title,actions: widget.action,showBack: widget.showBack, )
          : null,

      backgroundColor: Color(0xffffffff),
      drawer: widget.drawer,
      body: widget.body,
      floatingActionButton:widget.floatingActionButton
    );
  }
}
