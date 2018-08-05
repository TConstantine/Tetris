import 'package:tetris/data/model/game.dart';
import 'package:tetris/domain/converters/tetromino_converter.dart';
import 'package:tetris/ui/model/grid_view_model.dart';

class GetNextTetromino {
  final Game _game;
  final TetrominoConverter _converter;

  GetNextTetromino(this._game, this._converter);

  GridViewModel execute() {
    return _converter.convertToViewModel(_game.nextTetromino());
  }
}