import 'package:flutter/material.dart';

class TechnicalSheet extends StatelessWidget {
  final String label;
  final dynamic value;
  const TechnicalSheet({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color.fromRGBO(154, 154, 154, 1),
              ),
            ),
            TextSpan(
              text: '$value ',
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(168, 168, 168, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
