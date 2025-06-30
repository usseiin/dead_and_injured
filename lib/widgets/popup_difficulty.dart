import 'package:dead_and_injured/bloc/bloc.dart';
import 'package:dead_and_injured/data/app_data.dart';
import 'package:dead_and_injured/enum/difficulty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopupDifficulty extends StatelessWidget {
  const PopupDifficulty({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withAlpha(100),
      child: BlocBuilder<AppDataCubit, AppData>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Difficult"),
              if (!state.complete && state.result.isNotEmpty)
                Text(
                    "You will loss your current game, by changing the difficulty"),
              ...Difficulty.values.map(
                (value) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 12,
                  children: [
                    Radio<Difficulty>(
                      toggleable: state.complete,
                      value: value,
                      groupValue: state.difficulty,
                      onChanged: (value) {
                        Navigator.of(context).pop(value);
                      },
                    ),
                    Text(value.name),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
