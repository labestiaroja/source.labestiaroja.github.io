import 'package:flutter/material.dart';
import 'package:labestiaroja/src/styles/styles.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey.shade900,
        ),
      ),
      builder: (context, child) {
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(32.0),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Under Develop',
                style: kIntroTextStyle,
              ),
            ),
          ),
        );
      },
    );
  }
}
