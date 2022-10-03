import 'package:flutter/material.dart';

import '../bl/bl.dart';
import '../main.dart';
import '../pages/home.dart';

class PopScreen extends StatelessWidget {
  const PopScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .8,
        height: MediaQuery.of(context).size.height * .7,
        child: Material(
          color: const Color(0x55ffffff),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Congratulation\nYou won!',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      child: const Text('Play Again'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                          (route) => false,
                        );
                      },
                      child: const Text('End'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
