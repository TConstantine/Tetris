import 'package:flutter/material.dart';
import 'package:tetris/data/model/game.dart';
import 'package:tetris/data/model/game_renderer.dart';
import 'package:tetris/ui/game/game_contract.dart';

class GamePresenter implements GameContractPresenter {
  final Game _game;

  GamePresenter(this._game);

  @override
  CustomPainter nextTetrominoRenderer() {
    return GameRenderer(_game.nextTetromino());
  }
}
