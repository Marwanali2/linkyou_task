import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkyou_task/core/widgets/svg_picture_component.dart';

class LoginButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;

  const LoginButton({
    super.key,
    this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.lightBlue),
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$text",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
              ),
            ),
            const SizedBox(width: 10),
            const SvgPictureComponent(
              name: 'assets/svg/google.svg',
              height: 20,
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
