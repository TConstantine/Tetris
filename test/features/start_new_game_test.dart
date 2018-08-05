import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:tetris/data/model/game.dart';
import 'package:tetris/domain/converters/board_converter.dart';
import 'package:tetris/domain/converters/tetromino_converter.dart';
import 'package:tetris/domain/usecases/get_board.dart';
import 'package:tetris/domain/usecases/get_completed_lines.dart';
import 'package:tetris/domain/usecases/get_level.dart';
import 'package:tetris/domain/usecases/get_next_tetromino.dart';
import 'package:tetris/domain/usecases/get_score.dart';
import 'package:tetris/domain/usecases/start_game.dart';
import 'package:tetris/ui/game/game_contract.dart';
import 'package:tetris/ui/game/game_presenter.dart';
import 'package:tetris/ui/model/grid_view_model.dart';

class GameViewMock extends Mock implements GameContractView {}

void main() {
  GameContractView _view;
  GameContractPresenter _presenter;

  setUp(() {
    final game = Game();
    final startGameUseCase = StartGame(game);
    final boardConverter = BoardConverter();
    final getBoardUseCase = GetBoard(game, boardConverter);
    final tetrominoConverter = TetrominoConverter();
    final getNextTetrominoUseCase = GetNextTetromino(game, tetrominoConverter);
    final getLevelUseCase = GetLevel(game);
    final getScoreUseCase = GetScore(game);
    final getCompletedLinesUseCase = GetCompletedLines(game);
    _view = GameViewMock();
    _presenter = GamePresenter(
      _view,
      startGameUseCase,
      getBoardUseCase,
      getNextTetrominoUseCase,
      getLevelUseCase,
      getScoreUseCase,
      getCompletedLinesUseCase,
    );
  });

  test('Start a new game without playing', () {
    final boardViewModel = GridViewModel(_emptyBoardGrid());
    final nextTetrominoViewModel = GridViewModel(_tetrominoGrid());

    _presenter.startNewGame();

    verify(_view.displayBoard(boardViewModel));
    verify(_view.displayNextTetromino(nextTetrominoViewModel));
    verify(_view.displayLevel(0));
    verify(_view.displayScore(0));
    verify(_view.displayCompletedLines(0));
  });
}

List<List<Color>> _emptyBoardGrid() {
  final grid = List<List<Color>>(20);
  for (int row = 0; row < grid.length; row++) {
    grid[row] = List<Color>(10);
    for (int column = 0; column < grid[row].length; column++) {
      grid[row][column] = Colors.transparent;
    }
  }
  return grid;
}

List<List<Color>> _tetrominoGrid() {
  return [
    [
      Colors.purple,
      Colors.purple,
      Colors.purple,
    ],
    [
      Colors.transparent,
      Colors.purple,
      Colors.transparent,
    ],
  ];
}
