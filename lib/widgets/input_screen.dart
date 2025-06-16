import 'dart:developer';

import 'package:dead_and_injured/bl/app_data.dart';
import 'package:dead_and_injured/bl/bloc.dart';
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
          child: Text(
            '${state.displayedValue.split("").join(" ")}\n\n\n${state.currentValue.split('').join(' ')}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      );
    });
  }
}
