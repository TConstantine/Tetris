import 'package:tetris/data/model/game.dart';
import 'package:tetris/domain/converters/board_converter.dart';
import 'package:tetris/ui/model/drawable_grid.dart';

class GetBoard {
  final Game _game;
  final BoardConverter _boardConverter;

  GetBoard(this._game, this._boardConverter);

  DrawableGrid execute() {
    return _boardConverter.convertToViewModel(_game.board());
  }
}