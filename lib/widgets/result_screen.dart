import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.res,
  }) : super(key: key);

  final List<Map<String, String>> res;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: ListView(
        reverse: true,
        children: [
          ...List.generate(
            res.length,
            (index) => ListTile(
              leading: Text(res[index]['play'] as String),
              title: Text(
                res[index]['result'] as String,
              ),
            ),
          )
        ],
      ),
    );
  }
}
