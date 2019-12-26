import 'package:flutter/cupertino.dart';
import 'package:flutter_app_silinecek2/state_enum.dart';

class GameManager extends ChangeNotifier {
  AssetImage imageEmpty = AssetImage("assets/edit.png");
  BoxState boxState = BoxState.empty;
  bool isCross = true;
  String scoreBoard = "Welcome";
  bool isGameFinished = false;
  AssetImage imageCross = AssetImage("assets/cross.png");
  AssetImage imageCircle = AssetImage("assets/circle.png");

  List<AssetImage> _boxImagesList = [
    AssetImage("assets/edit.png"),
    AssetImage("assets/edit.png"),
    AssetImage("assets/edit.png"),
    AssetImage("assets/edit.png"),
    AssetImage("assets/edit.png"),
    AssetImage("assets/edit.png"),
    AssetImage("assets/edit.png"),
    AssetImage("assets/edit.png"),
    AssetImage("assets/edit.png"),
  ];

  List<BoxState> _boxStateList = [
    BoxState.empty,
    BoxState.empty,
    BoxState.empty,
    BoxState.empty,
    BoxState.empty,
    BoxState.empty,
    BoxState.empty,
    BoxState.empty,
    BoxState.empty,
  ];

  List<AssetImage> get imageList => _boxImagesList;

  List<BoxState> get stateList => _boxStateList;

  changeBoxImage(int index) {
    if (!isGameFinished) {
      imageList[index] = isCross ? imageCross : imageCircle;
      stateList[index] = isCross ? BoxState.cross : BoxState.circle;
      togglePlayer();
      notifyListeners();
      isGameFinish();
    }

    //stateList.forEach((f) => print(f));
  }

  togglePlayer() {
    isCross = !isCross;
  }

  resetGame() {
    _boxImagesList = [
      AssetImage("assets/edit.png"),
      AssetImage("assets/edit.png"),
      AssetImage("assets/edit.png"),
      AssetImage("assets/edit.png"),
      AssetImage("assets/edit.png"),
      AssetImage("assets/edit.png"),
      AssetImage("assets/edit.png"),
      AssetImage("assets/edit.png"),
      AssetImage("assets/edit.png"),
    ];
    _boxStateList = [
      BoxState.empty,
      BoxState.empty,
      BoxState.empty,
      BoxState.empty,
      BoxState.empty,
      BoxState.empty,
      BoxState.empty,
      BoxState.empty,
      BoxState.empty,
    ];
    scoreBoard = "";
    isGameFinished = false;
    notifyListeners();
  }

  isGameFinish() {
    for (int row = 0; row < 7; row += 3) {
      //Right To left
      if (stateList[row] != BoxState.empty) {
        if (imageList[row] == imageList[row + 1] &&
            imageList[row + 1] == imageList[row + 2]) {
          scoreBoard =
              (stateList[row] == BoxState.circle) ? "Circle Won" : "CrossWon";
          isGameFinished = true;
          return;
        }
      }
    }

    // Top to Bottom
    for (int col = 0; col < 3; col++) {
      if (stateList[col] != BoxState.empty) {
        if (imageList[col] == imageList[col + 3] &&
            imageList[col + 3] == imageList[col + 6]) {
          scoreBoard =
              (stateList[col] == BoxState.circle) ? "Circle Won" : "CrossWon";
          isGameFinished = true;
          return;
        }
      }
    }
//
    // Cross LTR
    if (stateList[0] != BoxState.empty) {
      if (imageList[0] == imageList[4] && imageList[4] == imageList[8]) {
        scoreBoard =
            (stateList[0] == BoxState.circle) ? "Circle Won" : "CrossWon";
        isGameFinished = true;
        return;
      }
    }
    // Cross RTL
    if (stateList[2] != BoxState.empty) {
      if (imageList[2] == imageList[4] && imageList[4] == imageList[6]) {
        scoreBoard =
            (stateList[2] == BoxState.circle) ? "Circle Won" : "CrossWon";
        isGameFinished = true;
        return;
      }
    }

    if (stateList.every((item) => item != BoxState.empty)) {
      isGameFinished = true;
      scoreBoard = "Draw";
    }
  }
}
