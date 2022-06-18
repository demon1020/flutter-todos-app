import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback? onPressed;
  final double height;
  final double width;

  CustomFloatingButton(
      {required this.icon,
      required this.onPressed,
      this.height = 60,
      this.width = 60});

  // handling inputs with assert
  // CustomFloatingButton(
  //     {required this.icon, this.onPressed, this.height = 40, this.width = 40})
  //     : assert(onPressed == null, 'OnPressed cannot be null');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        child: icon,
        decoration: BoxDecoration(
          color: Color(0xFF34465D),
          borderRadius: BorderRadius.circular(200),
        ),
      ),
    );
  }
}
