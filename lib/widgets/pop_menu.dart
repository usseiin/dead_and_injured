import 'dart:developer';

import 'package:dead_and_injured/bloc/bloc.dart';
import 'package:dead_and_injured/enum/difficulty.dart';
import 'package:dead_and_injured/pages/history.dart';
import 'package:dead_and_injured/widgets/popup_difficulty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopUpButton extends StatelessWidget {
  const PopUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AppDataCubit>();
    return PopupMenuButton<String>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: "settings",
          onTap: () async {
            Difficulty? value;
            try {
              value = await showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => PopupDifficulty(),
              ) as Difficulty;
            } catch (e) {
              log("pop up error");
            }
            if (value != null) {
              bloc.restart(value);
            }
          },
          child: Text("Settings"),
        ),
        PopupMenuItem(
          value: "history",
          child: Text("History"),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HistoryPage(),
            ),
          ),
        )
      ],
    );
  }
}
