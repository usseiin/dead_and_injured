import 'package:dead_and_injured/data/app_data.dart';
import 'package:dead_and_injured/bloc/bloc.dart';
import 'package:dead_and_injured/widgets/key_pad.dart';
import 'package:dead_and_injured/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appData = context.read<AppDataCubit>();
    return BlocListener<AppDataCubit, AppData>(
      listener: (context, state) {
        if (state.complete) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => PopScreen(),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 16,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ResultScreen(),
                      InputScreen(),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: appData.clearr,
                      child: const Text('clear'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        appData.checkInput(7);
                      },
                      child: const Text('play'),
                    ),
                    ElevatedButton(
                      onPressed: appData.delete,
                      child: const Icon(Icons.clear),
                    ),
                  ],
                ),
                KeyPads(
                  onTap: appData.updateValue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
