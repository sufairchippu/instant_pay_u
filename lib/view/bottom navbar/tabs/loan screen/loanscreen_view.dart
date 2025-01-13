import 'package:flutter/material.dart';

class LoanscreenView extends StatefulWidget {
  const LoanscreenView({super.key});

  @override
  State<LoanscreenView> createState() => _LoanscreenViewState();
}

class _LoanscreenViewState extends State<LoanscreenView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text("Instant PayU loan"),),
      ],
    );
  }
}