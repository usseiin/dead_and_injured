import 'dart:math';

String generate4diffnumber() {
  Set<String> set = {};
  while (set.length < 4) {
    set.add(Random().nextInt(10).toString());
  }
  return set.toList().join("");
}
