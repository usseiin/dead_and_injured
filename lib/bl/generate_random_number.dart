// import 'dart:math';

import 'package:dead_and_injured/bl/difficulty.dart';

String generateNumber([Difficulty? difficulty = Difficulty.easy]) {
  var values = [...difficulty!.value];
  final length = difficulty.length;
  values.shuffle();
  return values.getRange(0, length).join("");
}
