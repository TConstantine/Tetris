import 'package:tetris/data/model/block.dart';
import 'package:tetris/data/model/string_matcher.dart';
import 'package:tetris/data/model/tetromino_type.dart';

class Tetromino {
  final TetrominoType _type;
  final StringMatcher _stringMatcher;
  List<List<Block>> _blocks;

  Tetromino(this._type, this._stringMatcher) {
    final List<String> shape = _stringMatcher.matchToString(_type);
    _blocks = List.generate(
        shape.length,
            (row) => List.generate(
            shape[row].length, (column) => Block(shape[row].substring(column, column + 1))));
  }

  int rows() {
    return _blocks.length;
  }

  int columns() {
    return _blocks[0].length;
  }

  TetrominoType type() => _type;

  String valueAt(int row, int column) {
    return _blocks[row][column].value();
  }

  bool isEmptyAt(int row, int column) {
    return _blocks[row][column].isEmpty();
  }
}
