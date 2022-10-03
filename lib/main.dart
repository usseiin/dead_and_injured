import 'package:flutter/material.dart';

import 'bl/bl.dart';
import 'pages/home.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameScreen(
                      guestVal: generate4diffnumber(),
                    ),
                  ),
                  (route) => false,
                );
              },
              child: const Text('Start Game '),
            ),
          ],
        ),
      )),
    );
  }
}
