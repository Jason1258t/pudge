import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pudge/shared/theme/colors.dart';

import 'outline_text_field.dart';

class PasswordField extends HookWidget {
  const PasswordField({super.key, this.hint = 'Password', this.controller});

  final String hint;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final passwordObscure = useState(true);

    return CustomOutlineTextField(
      hintText: hint,
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      prefixIcon: Icon(Icons.lock_outline_rounded, color: AppColors.hint),
      obscureText: passwordObscure.value,
      suffixIcon: IconButton(
        onPressed: () => passwordObscure.value = !passwordObscure.value,
        icon: Icon(Icons.remove_red_eye_outlined),
        color: AppColors.hint,
      ),
    );
  }
}
