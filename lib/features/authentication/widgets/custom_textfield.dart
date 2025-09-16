import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_color.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.isPassword = false,
    required this.controller,
  });


  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return "${widget.label} kiritilishi kerak";
    }

    if (widget.isPassword) {
      if (value.length < 6) {
        return "Parol kamida 6 ta belgidan iborat bo‘lishi kerak";
      }
    } else if (widget.label.toLowerCase() == "email") {
      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
        return 'Please enter valid email address';
      }
    }

    return null;
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final isValid = _validator(widget.controller.text) == null &&
        widget.controller.text.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "GeneralSans",
            ),
          ),
          SizedBox(height: 4.h),
          TextFormField(
            controller: widget.controller,
            obscureText: widget.isPassword ? obscureText : false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: _validator,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: AppColors.hintColor,
                fontSize: 16.sp,
                fontFamily: "GeneralSans",
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: isValid ? Colors.green : AppColors.hintColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: isValid ? Colors.green : AppColors.hintColor,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: Colors.red, width: 2),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: Colors.red, width: 2),
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                icon: Icon(
                  obscureText
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: AppColors.hintColor,
                ),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
