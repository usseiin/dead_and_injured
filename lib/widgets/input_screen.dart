import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({
    Key? key,
    required this.rew,
    required this.value,
  }) : super(key: key);

  final String rew;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        alignment: Alignment.topCenter,
        child: Text(
          '${rew.split('').join(' ')}\n\n\n${value.split('').join(' ')}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
