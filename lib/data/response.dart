class Response {
  final String value;
  final int dead;
  final int injured;

  const Response(
      {required this.value, required this.dead, required this.injured});

  @override
  String toString() => "dead: $dead injured: $injured";

  Map<String, dynamic> toJson() =>
      {"value": value, "dead": dead, "injured": injured};

  bool isDead(int length) => dead == length;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        value: json["value"],
        dead: json["dead"],
        injured: json["injured"],
      );
}
