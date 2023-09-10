import 'dart:async';

import 'package:flutter/material.dart';

class Debounce {
  static Timer? _debounceTimer;

  static void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    _debounceTimer = Timer(duration, callback);
  }
}
