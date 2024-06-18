import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GameProvider extends ChangeNotifier {
  String player_1Name = "Player 1";
  String player_2Name = "Player 2";
  int counter = 0;
  int score_p1 = 0;
  int score_p2 = 0;
  int count_draw = 0;
  bool p1_win = false;
  bool p2_win = false;
  bool draw = false;
  List<Widget?> game = [
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
  ];
  List<int> indexWin = [];

  List<int> x_plays = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<int> o_plays = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  void addgame(int index, String symbol) {
    game[index] = SvgPicture.asset(symbol);
    notifyListeners();
  }

  bool checkWinner(List<int> plays) {
    for (int i = 0; i < 9; i += 3) {
      if (plays[i] == 1 && plays[i + 1] == 1 && plays[i + 2] == 1) {
        indexWin.add(i);
        indexWin.add(i + 1);
        indexWin.add(i + 2);
        notifyListeners();
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (plays[i] == 1 && plays[i + 3] == 1 && plays[i + 6] == 1) {
        indexWin.add(i);
        indexWin.add(i + 3);
        indexWin.add(i + 6);
        notifyListeners();
        return true;
      }
    }
    if (plays[0] == 1 && plays[4] == 1 && plays[8] == 1) {
      indexWin.add(0);
      indexWin.add(4);
      indexWin.add(8);
      notifyListeners();
      return true;
    }
    if (plays[2] == 1 && plays[4] == 1 && plays[6] == 1) {
      indexWin.add(2);
      indexWin.add(4);
      indexWin.add(6);
      notifyListeners();
      return true;
    }
    return false;
  }

  void resetGame() {
    counter = 0;
    game = [
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
    ];
    x_plays = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    o_plays = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    notifyListeners();
  }

  void playsound(String audio) async {
    final player = AudioPlayer();
    await player.play(AssetSource(audio));
  }

  changePlayerName({String player1 = "Player 1", String player2 = "Player 2"}) {
    if (player1 != "") {
      player_1Name = player1;
    }
    if (player2 != "") {
      player_2Name = player2;
    }

    notifyListeners();
  }
}
