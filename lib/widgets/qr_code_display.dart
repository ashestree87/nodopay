import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeDisplay extends StatelessWidget {
  final String amount;
  final Color color;

  QrCodeDisplay({required this.amount, required this.color});

  @override
  Widget build(BuildContext context) {
    final String qrData = 'https://nodopay.web.app/pay?amount=$amount';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: QrImage(
        data: qrData,
        version: QrVersions.auto,
        size: 200.0,
        foregroundColor: color,
      ),
    );
  }
}
