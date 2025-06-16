import 'package:flutter/material.dart';

class KeyPads extends StatelessWidget {
  const KeyPads({super.key, required this.onTap});
  final Function(int int) onTap;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 16,
      runSpacing: 16,
      children: [
        ...List.generate(
          10,
          (index) => KeyPadButton(
            onTap: onTap,
            index: index,
          ),
        ),
      ],
    );
  }
}

class KeyPadButton extends StatelessWidget {
  const KeyPadButton({super.key, required this.onTap, required this.index});

  final Function(int int) onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: CircleAvatar(
        radius: 30,
        child: Text(
          index.toString(),
        ),
      ),
    );
  }
}
