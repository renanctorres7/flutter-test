import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange)),
      home: const PaymentsTransactionsPage(),
    );
  }
}

class PaymentsTransactionsPage extends StatelessWidget {
  const PaymentsTransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(color: Colors.deepOrange));
  }
}
