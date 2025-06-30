import 'dart:convert';

import 'package:dead_and_injured/data/app_data.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class AppDataLocal {
  @Id()
  int id = 0;
  String? generatedValue;
  String? displayedValue;
  String? difficulty;
  int? startTime;
  int? endTime;
  String? result;

  AppDataLocal();

  factory AppDataLocal.fromAppData(AppData data) {
    var appData = AppDataLocal();
    appData.generatedValue = data.generatedValue;
    appData.difficulty = data.difficulty.name;
    appData.displayedValue = data.displayedValue;
    appData.endTime = data.endTime.millisecondsSinceEpoch;
    appData.startTime = data.startTime.millisecondsSinceEpoch;
    appData.result = jsonEncode(data.result
        .map(
          (response) => response.toJson(),
        )
        .toList());

    return appData;
  }
}
