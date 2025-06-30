import 'dart:convert';

import 'package:dead_and_injured/data/app_data_local.dart';
import 'package:dead_and_injured/enum/difficulty.dart';
import 'package:equatable/equatable.dart';

import 'response.dart';

class AppData extends Equatable {
  final String generatedValue;
  final String displayedValue;
  final String currentValue;
  final bool complete;
  final Difficulty difficulty;
  final DateTime startTime;
  final DateTime endTime;
  final List<Response> result;

  const AppData({
    required this.currentValue,
    required this.result,
    required this.displayedValue,
    required this.generatedValue,
    required this.complete,
    required this.difficulty,
    required this.startTime,
    required this.endTime,
  });

  factory AppData.createDefault(String generatedValue, Difficulty difficulty) =>
      AppData(
        currentValue: "",
        result: <Response>[],
        displayedValue: "*" * difficulty.length,
        generatedValue: generatedValue,
        complete: false,
        difficulty: difficulty,
        startTime: DateTime.now(),
        endTime: DateTime.now(),
      );

  int get duration =>
      complete ? (endTime.difference(startTime).inMilliseconds) : 0;

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
        startTime: startTime,
        endTime: DateTime.now(),
      );

  @override
  List<Object> get props => [result, displayedValue, currentValue, endTime];

  @override
  String toString() {
    return "$currentValue, $displayedValue, $result";
  }

  factory AppData.fromJson(Map<String, dynamic> json) => AppData(
        currentValue: json["currentValue"],
        result: (json["result"] as List)
            .map((json) => Response.fromJson(json))
            .toList(),
        displayedValue: json["displayedValue"],
        generatedValue: json["generatedValue"],
        complete: json["complete"],
        difficulty: json["difficulty"],
        startTime:
            DateTime.fromMillisecondsSinceEpoch(json['startTime'] as int),
        endTime: DateTime.fromMillisecondsSinceEpoch(json["endTime"] as int),
      );

  factory AppData.fromAppDataLocal(AppDataLocal appDataLocal) => AppData(
      currentValue: appDataLocal.generatedValue!,
      result: (jsonDecode(appDataLocal.result!) as List)
          .map(
            (json) => Response.fromJson(json),
          )
          .toList(),
      displayedValue: appDataLocal.displayedValue!,
      generatedValue: appDataLocal.generatedValue!,
      complete: true,
      difficulty: appDataLocal.difficulty!.toDifficulty(),
      startTime: DateTime.fromMicrosecondsSinceEpoch(appDataLocal.startTime!),
      endTime: DateTime.fromMicrosecondsSinceEpoch(appDataLocal.endTime!));
  Map<String, dynamic> toJson() => {
        "currentValue": currentValue,
        "displayedValue": displayedValue,
        "generatedValue": generatedValue,
        "result": result.map((response) => response.toJson()).toList(),
        "difficulty": difficulty.name,
        "complete": complete,
        "startTime": startTime.millisecondsSinceEpoch,
        "endTime": endTime.millisecondsSinceEpoch,
      };
}
