import 'package:dead_and_injured/bl/difficulty.dart';
import 'package:equatable/equatable.dart';

class AppData extends Equatable {
  final String generatedValue;
  final List<Response> result;
  final String displayedValue;
  final String currentValue;
  final bool complete;
  final Difficulty difficulty;
  final int time;

  const AppData(
      {required this.currentValue,
      required this.result,
      required this.displayedValue,
      required this.generatedValue,
      required this.complete,
      required this.difficulty,
      required this.time});

  factory AppData.createDefault(String generatedValue, Difficulty difficulty) =>
      AppData(
        currentValue: "",
        result: <Response>[],
        displayedValue: "*" * difficulty.length,
        generatedValue: generatedValue,
        complete: false,
        difficulty: difficulty,
        time: 0,
      );

  AppData copyWith({
    List<Response>? result,
    String? currentValue,
    String? displayedValue,
    bool? complete,
    int? time,
  }) =>
      AppData(
        currentValue: currentValue ?? this.currentValue,
        result: result ?? this.result,
        displayedValue: displayedValue ?? this.displayedValue,
        generatedValue: generatedValue,
        complete: complete ?? this.complete,
        difficulty: difficulty,
        time: time ?? this.time,
      );

  @override
  List<Object> get props => [
        result,
        displayedValue,
        currentValue,
        time,
      ];

  @override
  String toString() {
    return "$currentValue, $displayedValue, $result";
  }
}

class Response {
  final String value;
  final int dead;
  final int injured;

  const Response(
      {required this.value, required this.dead, required this.injured});

  @override
  String toString() => "$dead dead, $injured injured";

  bool isDead(int length) => dead == length;
}
