import 'package:tetris/ui/model/grid_view_model.dart';

abstract class GameContractView {
  void displayBoard(GridViewModel boardViewModel);
  void displayCompletedLines(int completedLines);
  void displayLevel(int level);
  void displayNextTetromino(GridViewModel nextTetrominoViewModel);
  void displayScore(int score);
}

abstract class GameContractPresenter {
  void startNewGame();
}
