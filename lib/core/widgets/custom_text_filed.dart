import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlyproject/core/utils/app_color.dart';

class CustomTextFiled extends StatefulWidget {
  final String? hint;
  final Widget? suffix;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final TextStyle? labelStyle;
  final Color? fillcolor;
  final TextStyle? textstyle;
  final Function(String)? onchange;
  final TextInputType? keybordtype;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly;
  final void Function(PointerDownEvent)? onTap;

  const CustomTextFiled({
    super.key,
    this.hint,
    this.suffix,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.labelText,
    this.labelStyle,
    this.fillcolor,
    this.textstyle,
    this.onchange,
    this.keybordtype,
    this.maxLength,
    this.inputFormatters,
    this.readOnly,
    this.onTap,
  });

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  late bool _obscure;
  @override
  void initState() {
    _obscure = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly ?? false,
      inputFormatters: widget.inputFormatters,
      maxLength: widget.maxLength,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (_) =>
          widget.onTap ?? FocusManager.instance.primaryFocus?.unfocus(),
      keyboardType: widget.keybordtype,
      onChanged: widget.onchange,
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        // display counter text when max length is set
        counterText: '',
        labelText: widget.labelText,
        labelStyle: widget.labelStyle,
        prefixIcon: widget.prefixIcon,
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: widget.obscureText
            ? IconButton(
                color: AppColor.primary.withOpacity(0.7),
                icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () => setState(() => _obscure = !_obscure),
              )
            : widget.suffix,
        fillColor: widget.fillcolor ?? const Color(0xffEDEDED),
        filled: true,
        focusedBorder: _border(AppColor.primary),
        enabledBorder: _border(const Color(0xffEDEDED)),
        errorBorder: _border(AppColor.error),
        focusedErrorBorder: _border(AppColor.error),
      ),
      obscureText: _obscure,
      style: widget.textstyle ?? const TextStyle(color: Colors.black),
    );
  }
}

InputBorder? _border(Color color) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color),
    borderRadius: BorderRadius.circular(16),
  );
}