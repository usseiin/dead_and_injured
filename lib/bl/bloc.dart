import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dead_and_injured/bl/app_data.dart';
import 'package:dead_and_injured/bl/generate_random_number.dart';
import 'package:dead_and_injured/bl/logic.dart';

class AppDataCubit extends Cubit<AppData> {
  AppDataCubit() : super(AppData.createDefault(generate4diffnumber()));

  void restart() {
    final generatedValue = generate4diffnumber();
    final newState = AppData.createDefault(generatedValue);
    emit(newState);
  }

  void updateValue(int value) {
    log(state.generatedValue);
    if (state.currentValue.length < 4 &&
        !state.currentValue.contains(value.toString())) {
      final newState =
          state.copyWith(currentValue: state.currentValue + value.toString());
      emit(newState);
    }
  }

  void checkInput() {
    if (state.currentValue.length == 4) {
      final res = deadAndInjured(state.currentValue.split("").toSet(),
          state.generatedValue.split("").toSet());
      AppData clear = _clear();
      AppData newState = clear
          .copyWith(result: [...state.result, res], complete: res.isDead());
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
