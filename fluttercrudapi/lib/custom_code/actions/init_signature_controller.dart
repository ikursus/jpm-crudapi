// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:signature/signature.dart';

Future initSignatureController() async {
  SignatureControllerSingleton().init();
}

class SignatureControllerSingleton {
  static final SignatureControllerSingleton _singleton =
      SignatureControllerSingleton._internal();

  factory SignatureControllerSingleton() {
    return _singleton;
  }

  SignatureControllerSingleton._internal();

  SignatureController? signatureController;

  init() {
    signatureController = SignatureController(
      penStrokeWidth: 5,
      penColor: Colors.purple,
      exportPenColor: Colors.purple,
      exportBackgroundColor: Colors.white,
    );
  }
}
