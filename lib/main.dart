import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nodopay/widgets/amount_input.dart';
import 'package:nodopay/widgets/circular_qr_code.dart';
import 'package:nodopay/widgets/qr_code_display.dart';

void main() {
  runApp(NodopayApp());
}

class NodopayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Force portrait mode only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return MaterialApp(
      title: 'Nodopay',
      theme: ThemeData.dark(),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? amount;

  void _onAmountEntered(String value) {
    setState(() {
      amount = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'NodoPay',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                AmountInput(onAmountEntered: _onAmountEntered),
                if (amount != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: CircularQrCode(amount: amount!, color: Colors.white),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
