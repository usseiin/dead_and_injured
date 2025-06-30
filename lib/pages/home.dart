import 'dart:developer';

import 'package:dead_and_injured/data/app_data.dart';
import 'package:dead_and_injured/bloc/bloc.dart';
import 'package:dead_and_injured/pages/game_screen.dart';
import 'package:dead_and_injured/widgets/pop_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.read<AppDataCubit>();
    log("s: ${s.state}");
    return Scaffold(
      appBar: AppBar(
        actions: [PopUpButton()],
      ),
      endDrawer: PopUpButton(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<AppDataCubit, AppData>(
                builder: (context, state) {
                  final isNewGame =
                      !(state.result.isNotEmpty && !state.complete);
                  final text = !isNewGame ? "Continue" : "Start Game";
                  return ElevatedButton(
                    onPressed: () {
                      if (isNewGame) {
                        context.read<AppDataCubit>().restart();
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return GameScreen();
                          },
                        ),
                      );
                    },
                    child: Text(text),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
