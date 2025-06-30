import 'package:dead_and_injured/enum/difficulty.dart';

import 'response.dart';

Response deadAndInjured(Set<String> userInput, Set<String> generatedValue,
    [Difficulty? difficulty = Difficulty.easy]) {
  List set1 = userInput.toList();
  List set2 = generatedValue.toList();
  var length = difficulty!.length;
  int dead = 0;
  int injured = 0;
  Set listOfDead = {};
  for (int i = 0; i < length; i++) {
    for (int j = 0; j < length; j++) {
      if (set1[i] == set2[j] && set2.indexOf(set1[i]) == i) {
        dead++;
        listOfDead.add(set1[i]);
      } else if (set1[i] == set2[j] && !listOfDead.contains(set1[i])) {
        injured++;
      } else {}
    }
  }
  return Response(
      value: userInput.toList().join(""), dead: dead, injured: injured);
}
