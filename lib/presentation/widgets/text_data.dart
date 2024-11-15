import 'package:flutter/material.dart';

import '../../core/style/app_styles.dart';

class TextData extends StatelessWidget {
  const TextData({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppStyles.mainPadding,
        child: Text(
          text,
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
