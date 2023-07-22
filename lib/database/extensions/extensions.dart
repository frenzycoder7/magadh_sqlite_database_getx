import 'package:flutter/foundation.dart';

extension CustomBool on bool {
  bool get isTrue => this == true;
  bool get isFalse => this == false;
}

extension CustomString on String {
  void log() {
    if (kDebugMode) {
      print(this);
    }
  }
}
