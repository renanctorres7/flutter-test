import 'package:base_project/src/core/localization/language.dart';
import 'package:flutter/material.dart';

class AppDialogError extends StatelessWidget {
  final String? errorMessage;
  final String? errorTitle;

  const AppDialogError({super.key, this.errorMessage, this.errorTitle});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(errorTitle ?? Language.of.somethingWentWrong),
      content: Text(errorMessage ?? Language.of.somethingWentWrongDescription),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
