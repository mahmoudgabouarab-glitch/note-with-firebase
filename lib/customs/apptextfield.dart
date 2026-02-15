import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final bool obscureText;

  const AppTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
    this.validator,
    this.onSaved,
    this.obscureText = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool? isValid; 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            color: Color(0xff6E6E82),
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          validator: (value) {
            final result = widget.validator?.call(value);
            setState(() {
              isValid = result == null;
            });
            return result;
          },

          onChanged: (val) {
            if (widget.validator != null) {
              final result = widget.validator!(val);
              setState(() {
                isValid = result == null;
              });
            }
          },
          onSaved: widget.onSaved,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Color(0xff7F7F92)),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffE5E5E5), width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff665AF0), width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            suffixIcon: isValid == null
                ? null
                : isValid!
                ? const Icon(Icons.check_circle, color: Colors.green)
                : const Icon(Icons.cancel, color: Colors.red),
          ),
        ),
      ],
    );
  }
}
