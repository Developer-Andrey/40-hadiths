import 'package:flutter/material.dart';

import '../../core/style/app_styles.dart';

class ErrorTextData extends StatelessWidget {
  const ErrorTextData({
    super.key,
    required this.errorText,
  });

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppStyles.mainPadding,
        child: Text(
          errorText,
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).colorScheme.error,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
