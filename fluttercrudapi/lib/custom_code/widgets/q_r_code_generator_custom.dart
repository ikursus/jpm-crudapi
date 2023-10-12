// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:custom_qr_generator_2/custom_qr_generator.dart';

class QRCodeGeneratorCustom extends StatefulWidget {
  const QRCodeGeneratorCustom({
    Key? key,
    this.width,
    this.height,
    required this.qrvalue,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String qrvalue;

  @override
  _QRCodeGeneratorCustomState createState() => _QRCodeGeneratorCustomState();
}

class _QRCodeGeneratorCustomState extends State<QRCodeGeneratorCustom> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      // painter: Painter(),
      painter: QrPainter(
          data: widget.qrvalue,
          options: const QrOptions(
              shapes: QrShapes(
                  darkPixel: QrPixelShapeRoundCorners(cornerFraction: .5),
                  frame: QrFrameShapeRoundCorners(cornerFraction: .25),
                  ball: QrBallShapeRoundCorners(cornerFraction: .25)),
              colors: QrColors(
                  dark: QrColorLinearGradient(colors: [
                Color.fromARGB(255, 255, 0, 0),
                Color.fromARGB(255, 0, 0, 255)
              ], orientation: GradientOrientation.leftDiagonal)))),
      size: const Size(350, 350),
    );
  }
}
