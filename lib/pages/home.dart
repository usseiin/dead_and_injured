// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../bl/bl.dart';
import '../widgets/widgets.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({
    Key? key,
    required this.guestVal,
  }) : super(key: key);

  final Set<String> guestVal;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String value = "";
  String rew = "****";

  List<Map<String, String>> res = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Row(
                  children: [
                    ResultScreen(res: res),
                    InputScreen(rew: rew, value: value),
                  ],
                ),
              ),
              SizedBox(
                height: 75,
                child: Row(
                  children: [
                    const SizedBox(width: 35),
                    ElevatedButton(
                      onPressed: () {
                        value = '';
                        setState(() {});
                      },
                      child: const Text('clear'),
                    ),
                    const SizedBox(width: 35),
                    const Expanded(child: SizedBox()),
                    ElevatedButton(
                      onPressed: () {
                        if (value.length == 4) {
                          final result = deadAndInjured(
                            value.split('').toSet(),
                            widget.guestVal,
                          );
                          res.add(
                            {
                              'play': value,
                              'result': result,
                            },
                          );
                          if (result.contains('4 dead')) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const PopScreen();
                              },
                            );
                          }
                          value = '';
                          setState(() {});
                        }
                      },
                      child: const Text('play'),
                    ),
                    const SizedBox(width: 35),
                    ElevatedButton(
                      onPressed: () {
                        if (value.isNotEmpty) {
                          value = value.substring(0, value.length - 1);
                          setState(() {});
                        }
                      },
                      child: const Icon(Icons.clear),
                    ),
                    const SizedBox(width: 35),
                  ],
                ),
              ),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 16,
                runSpacing: 16,
                children: [
                  ...List.generate(
                    10,
                    (index) => GestureDetector(
                      onTap: () {
                        if (value.length < 4 &&
                            !value.contains(index.toString())) {
                          value = '$value$index';
                        }
                        setState(() {});
                      },
                      child: CircleAvatar(
                        radius: 30,
                        child: Text(
                          index.toString(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
