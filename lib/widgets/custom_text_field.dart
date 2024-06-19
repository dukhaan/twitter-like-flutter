import 'package:flutter/material.dart';
import 'package:twitter_like/core/color_values.dart';
import 'package:twitter_like/core/styles.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final IconData? prefixIcon;

  const CustomTextField({super.key, this.hintText, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ColorValues.grey50,
              ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Styles.defaultBorder),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Styles.defaultBorder),
            borderSide: const BorderSide(
              color: ColorValues.grey10,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 58,
          ),
          prefixIcon: Icon(
            prefixIcon,
            size: 24,
          ),
          prefixIconColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? Theme.of(context).primaryColor
                  : ColorValues.grey50)),
    );
  }
}
