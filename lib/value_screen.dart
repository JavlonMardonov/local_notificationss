import 'package:flutter/material.dart';

class ValueScreen extends StatelessWidget {
  final String value;
  const ValueScreen({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(value),
      ),
    );
  }
}
