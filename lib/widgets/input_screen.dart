import 'dart:developer';

import 'package:dead_and_injured/data/app_data.dart';
import 'package:dead_and_injured/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppDataCubit, AppData>(builder: (context, state) {
      return Expanded(
        child: Container(
          alignment: Alignment.center,
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                state.displayedValue.split("").join(" "),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                state.currentValue.split('').join(' '),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      );
    });
  }
}
