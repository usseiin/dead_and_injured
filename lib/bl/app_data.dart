import 'package:equatable/equatable.dart';

class AppData extends Equatable {
  final String generatedValue;
  final List<Response> result;
  final String displayedValue;
  final String currentValue;
  final bool complete;

  const AppData({
    required this.currentValue,
    required this.result,
    required this.displayedValue,
    required this.generatedValue,
    required this.complete,
  });

  factory AppData.createDefault(String generatedValue) => AppData(
        currentValue: "",
        result: <Response>[],
        displayedValue: "****",
        generatedValue: generatedValue,
        complete: false,
      );

  AppData copyWith({
    List<Response>? result,
    String? currentValue,
    String? displayedValue,
    bool? complete,
  }) =>
      AppData(
        currentValue: currentValue ?? this.currentValue,
        result: result ?? this.result,
        displayedValue: displayedValue ?? this.displayedValue,
        generatedValue: generatedValue,
        complete: complete ?? this.complete,
      );

  @override
  List<Object> get props => [result, displayedValue, currentValue];

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

  bool isDead() => dead == 4;
}
