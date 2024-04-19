import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:select_shop/core/theme/colors.dart';

class AppTextFormField extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? hintText;
  final bool? isPassword, shadow;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final void Function(String)? onFieldSubmitted;
  final Color? borderColor;
  const AppTextFormField({
    Key? key,
    required this.onChanged,
    this.isPassword,
    this.shadow,
    required this.validator,
    required this.controller,
    this.hintText,
    this.keyboardType,
    this.inputFormatters,
    this.maxLines = 1,
    this.onFieldSubmitted,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15,
        ),
        color: Colors.white,
        boxShadow: shadow == true
            ? <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  offset: const Offset(0.0, 2.0),
                  blurRadius: 3.0,
                ),
              ]
            : null,
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        // textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          decoration: TextDecoration.none,
          decorationThickness: 0,
        ),
        cursorColor: AppColors.mainColor,
        obscureText: isPassword ?? false,
        maxLines: maxLines,
        // obscuringCharacter: '*',
        decoration: InputDecoration(
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(
          //     15,
          //   ),
          //   // borderSide: BorderSide(
          //   //     color:
          //   //         cubit.isDark ? AppColors.bgColor : AppColors.greyColor),
          // ),
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(
          //     15,
          //   ),
          //   borderSide: BorderSide(
          //     color: borderColor ?? AppColors.mainColor,
          //   ),
          // ),
          border: InputBorder.none,
          // focusedBorder: InputBorder.none,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              15,
            ),
            borderSide: const BorderSide(color: AppColors.redColor),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),

          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColors.mainGreyColor,
          ),
          errorStyle: const TextStyle(
            color: AppColors.redColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}
