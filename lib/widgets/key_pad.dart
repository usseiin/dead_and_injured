import 'package:dead_and_injured/data/app_data.dart';
import 'package:dead_and_injured/bloc/bloc.dart';
import 'package:dead_and_injured/enum/difficulty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KeyPads extends StatelessWidget {
  const KeyPads({super.key, required this.onTap});
  final Function(String int) onTap;
  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppDataCubit, AppData, Difficulty>(
      selector: (state) => state.difficulty,
      builder: (context, state) {
        final keys = [...state.value];
        keys.shuffle();
        return Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 16,
          runSpacing: 16,
          children: [
            ...keys.map(
              (key) => KeyPadButton(onTap: onTap, index: key),
            )
          ],
        );
      },
    );
  }
}

class KeyPadButton extends StatelessWidget {
  const KeyPadButton({super.key, required this.onTap, required this.index});

  final Function(String int) onTap;
  final String index;

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
