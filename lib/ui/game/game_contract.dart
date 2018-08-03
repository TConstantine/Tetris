import 'package:tetris/ui/model/tetromino_view_model.dart';

abstract class GameContractView {
  void renderNextTetromino(TetrominoViewModel tetrominoViewModel);
}

abstract class GameContractPresenter {
  void startNewGame();
}
