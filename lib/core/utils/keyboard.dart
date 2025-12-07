import 'package:flutter/material.dart';

void unFocusEditors(BuildContext context) {
  FocusManager.instance.primaryFocus?.unfocus();
  FocusScope.of(context).unfocus();
}
