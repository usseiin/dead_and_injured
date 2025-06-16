import 'package:dead_and_injured/bl/app_data.dart';

Response deadAndInjured(Set<String> userInput, Set<String> generatedValue) {
  List set1 = userInput.toList();
  List set2 = generatedValue.toList();
  int dead = 0;
  int injured = 0;
  Set listOfDead = {};
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
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
