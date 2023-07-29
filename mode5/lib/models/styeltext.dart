import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const StyledText({
    Key? key,
    required this.text,
    TextStyle? style,
  })  : style = style ?? const TextStyle( fontSize: 24, color: Colors.white),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
