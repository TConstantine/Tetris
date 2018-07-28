import 'package:tetris/data/model/block.dart';

class Tetromino {
  static final Tetromino T = Tetromino(['TTT', '.T.']);
  List<List<Block>> _blocks;

  Tetromino(List<String> shape) {
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

  String valueAt(int row, int column) {
    return _blocks[row][column].value();
  }

  bool isEmptyAt(int row, int column) {
    return _blocks[row][column].isEmpty();
  }
}
