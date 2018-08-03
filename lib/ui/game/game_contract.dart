import 'package:tetris/ui/model/drawable_grid.dart';

abstract class GameContractView {
  void renderBoard(DrawableGrid boardViewModel);
  void renderNextTetromino(DrawableGrid tetrominoViewModel);
}

abstract class GameContractPresenter {
  void startNewGame();
}
