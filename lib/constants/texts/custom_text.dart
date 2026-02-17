import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final int? maxline;
  final TextOverflow? textOverflow;
  final Color colors;
  final double size;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const CustomText({
    super.key,
    required this.text,
    this.maxline,
    this.textOverflow,
    required this.colors,
    required this.size,
    this.fontWeight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxline,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      style: TextStyle(color: colors, fontSize: size, fontWeight: fontWeight),
    );
  }
}
