String deadAndInjured(Set<String> set_1, Set<String> set_2) {
  List set1 = set_1.toList();
  List set2 = set_2.toList();
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
  return "$dead dead, $injured injured";
}
