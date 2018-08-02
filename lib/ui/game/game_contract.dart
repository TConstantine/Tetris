import 'package:flutter/material.dart';

abstract class GameContractView {
  void renderNextTetromino(CustomPainter drawable);
}

abstract class GameContractPresenter {
  void startNewGame();
}
