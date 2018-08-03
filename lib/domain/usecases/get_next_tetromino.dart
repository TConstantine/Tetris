import 'package:tetris/data/model/game.dart';
import 'package:tetris/domain/converters/tetromino_converter.dart';
import 'package:tetris/ui/model/drawable_grid.dart';

class GetNextTetromino {
  final Game _game;
  final TetrominoConverter _converter;

  GetNextTetromino(this._game, this._converter);

  DrawableGrid execute() {
    return _converter.convertToViewModel(_game.nextTetromino());
  }
}