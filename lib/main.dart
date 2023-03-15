import 'package:dead_and_injured/pages/help_page.dart';
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
    return MaterialApp(
      title: "Dead and Injured",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  void goToHelpPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const HelpPage(),
    ));
  }

  void goToPlayGame(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => GameScreen(
          guestVal: generate4diffnumber(),
        ),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome!",
                    style: theme.textTheme.headlineMedium,
                  ),
                  Text(
                    "Dead and Injured",
                    style: theme.textTheme.displaySmall,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton.icon(
                    onPressed: () => goToHelpPage(context),
                    icon: const Icon(Icons.info),
                    label: const Text("help"),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () => goToPlayGame(context),
                    child: const Text('Start Game'),
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
