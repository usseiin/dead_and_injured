import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dead_and_injured/bl/app_data.dart';
import 'package:dead_and_injured/bl/difficulty.dart';
import 'package:dead_and_injured/bl/generate_random_number.dart';
import 'package:dead_and_injured/bl/logic.dart';

class AppDataCubit extends Cubit<AppData> {
  AppDataCubit()
      : super(AppData.createDefault(generateNumber(), Difficulty.easy));

  void restart() {
    final generatedValue = generateNumber(Difficulty.hard);
    final newState = AppData.createDefault(generatedValue, Difficulty.hard);
    emit(newState);
  }

  void updateValue(String value) {
    log(state.generatedValue);
    if (state.currentValue.length < state.difficulty.length &&
        !state.currentValue.contains(value)) {
      final newState = state.copyWith(currentValue: state.currentValue + value);
      emit(newState);
    }
  }

  void checkInput(int time) {
    if (state.currentValue.length == state.difficulty.length) {
      final res = deadAndInjured(state.currentValue.split("").toSet(),
          state.generatedValue.split("").toSet(), state.difficulty);
      AppData clear = _clear();
      AppData newState = clear.copyWith(
          result: [...state.result, res],
          complete: res.isDead(state.difficulty.length),
          time: time);
      emit(newState);
    }
  }

  _clear() {
    final newState = state.copyWith(currentValue: "");
    return newState;
  }

  clear() {
    final newState = _clear();
    emit(newState);
  }

  void delete() {
    if (state.currentValue.isNotEmpty) {
      final newState = state.copyWith(
          currentValue:
              state.currentValue.substring(0, state.currentValue.length - 1));
      emit(newState);
    }
  }
}
