import 'dart:async';

import 'package:flutter/material.dart';

class AlertUtil {
  static void snackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  static void alert(BuildContext context, String text,
      {Duration duration = const Duration(seconds: 2)}) {
    ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
        content: Text(text), actions: <Widget>[const Text('OK')]));
    Timer(duration, ScaffoldMessenger.of(context).clearMaterialBanners);
  }
}
