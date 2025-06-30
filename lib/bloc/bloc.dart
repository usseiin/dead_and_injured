import 'dart:developer';

import 'package:dead_and_injured/data/app_data.dart';
import 'package:dead_and_injured/data/app_data_local.dart';
import 'package:dead_and_injured/enum/difficulty.dart';
import 'package:dead_and_injured/data/generate_random_number.dart';
import 'package:dead_and_injured/data/logic.dart';
import 'package:dead_and_injured/main.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class AppDataCubit extends HydratedCubit<AppData> {
  AppDataCubit()
      : super(AppData.createDefault(generateNumber(), Difficulty.easy));

  void restart([Difficulty? difficulty]) {
    final diff = difficulty ?? state.difficulty;
    final generatedValue = generateNumber(diff);
    final newState = AppData.createDefault(generatedValue, diff);
    emit(newState);
  }

  late DateTime startTime;

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
      if (state.complete) {
        final data = AppDataLocal.fromAppData(state);
        appDataBox.put(data);
      }
    }
  }

  _clear() {
    final newState = state.copyWith(currentValue: "");
    return newState;
  }

  void clearr() {
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

  @override
  AppData fromJson(Map<String, dynamic> json) => AppData.fromJson(json);

  @override
  Map<String, dynamic> toJson(AppData state) => state.toJson();
}
