import 'package:flutter/material.dart';
import 'package:flutter_app_silinecek2/game-manager.dart';
import 'package:provider/provider.dart';
import 'box.dart';

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theProvider = Provider.of<GameManager>(context);
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
          child: Container(
              child: GridView.builder(
            itemCount: theProvider.imageList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 30,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                child: Box(
                  image: theProvider.imageList[index],
                  boxState: theProvider.stateList[index],
                ),
                onTap: () => theProvider.changeBoxImage(index),
              );
            }, //Image(image: imageO),
          )),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            theProvider.scoreBoard,
            style: TextStyle(fontSize: 50),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: MaterialButton(
            minWidth: 200,
            height: 50,
            color: Colors.blue,
            child: Text("Play Again"),
            onPressed: () => theProvider.resetGame(),
          ),
        )
      ],
    ));
  }
}
