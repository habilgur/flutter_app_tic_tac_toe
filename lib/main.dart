import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'game-manager.dart';
import 'tic-tac-toe.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<GameManager>(
          create: (context) => GameManager(), child: TicTacToe()),
    );
  }
}
