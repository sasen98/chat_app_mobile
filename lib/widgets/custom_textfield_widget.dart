import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFielWidget extends StatelessWidget {
  final String? hintText;
  final TextInputType? keyboardType;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextCapitalization? textCapitalization;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? label;
  final String? labelText;
  final double? borderRadius;
  final bool enabled;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  const CustomTextFielWidget({
    Key? key,
    this.hintText,
    this.keyboardType,
    this.isPassword = false,
    this.validator,
    this.textCapitalization,
    this.suffixIcon,
    this.prefixIcon,
    this.label,
    this.labelText,
    this.borderRadius,
    this.enabled = true,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> obscureText =
        ValueNotifier(isPassword ? true : false);
    return ValueListenableBuilder<bool>(
        valueListenable: obscureText,
        builder: (context, obscure, _) {
          return TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscure,
            validator: validator,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: prefixIcon,
              suffixIcon: isPassword
                  ? InkWell(
                      onTap: () {
                        obscureText.value = !obscureText.value;
                      },
                      child: obscure
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    )
                  : suffixIcon,
              label: label,
              labelText: labelText,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 5.r)),
              enabled: enabled,
            ),
            textCapitalization:
                textCapitalization ?? TextCapitalization.sentences,
          );
        });
  }
}
