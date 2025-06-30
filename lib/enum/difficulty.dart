enum Difficulty {
  easy(4, easyValues),
  medium(6, easyValues),
  hard(6, hardValues);

  final int length;
  final List<String> value;
  const Difficulty(this.length, this.value);
}

const easyValues = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
const hardValues = [...easyValues, "a", "b", "c", "d", "e", "f"];

extension DifficultyFromString on String {
  Difficulty toDifficulty() {
    switch (this) {
      case "hard":
        return Difficulty.hard;
      case "medium":
        return Difficulty.medium;
      default:
        return Difficulty.easy;
    }
  }
}
