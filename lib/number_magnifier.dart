library number_magnifier;

import 'package:flutter/material.dart';

class NumberMagnifier extends StatelessWidget {
  final TextStyle otherTextStyle;
  final TextStyle matchTextStyle;
  final String regex;
  final String text;
  final int decimalPoint;

  const NumberMagnifier({
    required this.otherTextStyle,
    required this.matchTextStyle,
    this.regex = r'\d+|\D+',
    this.text = '\$ 50 mbps',
    this.decimalPoint = 0,
  });

  @override
  Widget build(BuildContext context) {
    List<TextSpan> textSpans = [];

    bool isNumeric(String? str) =>
        str != null && double.tryParse(str) is double;

    List<dynamic> splitValues(String input) {
      return RegExp(regex)
          .allMatches(input)
          .map((match) => match[0]!)
          .map((string) => double.tryParse(string) ?? string)
          .toList();
    }

    List<dynamic> values = splitValues(text);

    for (dynamic value in values) {
      textSpans.add(
        isNumeric('$value')
            ? TextSpan(
                text: (value as double).toStringAsFixed(decimalPoint),
                style: matchTextStyle,
              )
            : TextSpan(
                text: '$value',
                style: otherTextStyle,
              ),
      );
    }

    return RichText(
      text: TextSpan(children: textSpans),
    );
  }
}
