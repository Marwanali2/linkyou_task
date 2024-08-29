import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'linkyou_task.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const LinkyouTask());
}
