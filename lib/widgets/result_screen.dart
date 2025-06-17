import 'dart:developer';

import 'package:dead_and_injured/bl/app_data.dart';
import 'package:dead_and_injured/bl/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppDataCubit, AppData, List<Response>>(
      selector: (state) => state.result,
      builder: (context, state) {
        return Expanded(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...List.generate(
                  state.length,
                  (index) => ListTile(
                    leading: Text(state[index].value),
                    title: Text(
                      "${state[index]}",
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
