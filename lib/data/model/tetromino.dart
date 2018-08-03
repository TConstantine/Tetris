import 'package:tetris/data/model/block.dart';
import 'package:tetris/data/model/tetromino_type.dart';

class Tetromino {
  static final Tetromino I = Tetromino.fromType(TetrominoType.I);
  static final Tetromino J = Tetromino.fromType(TetrominoType.J);
  static final Tetromino L = Tetromino.fromType(TetrominoType.L);
  static final Tetromino O = Tetromino.fromType(TetrominoType.O);
  static final Tetromino S = Tetromino.fromType(TetrominoType.S);
  static final Tetromino T = Tetromino.fromType(TetrominoType.T);
  static final Tetromino Z = Tetromino.fromType(TetrominoType.Z);
  TetrominoType _type;
  List<List<Block>> _blocks;

  Tetromino(List<String> shape) {
    _blocks = List.generate(
        shape.length,
        (row) => List.generate(
            shape[row].length, (column) => Block(shape[row].substring(column, column + 1))));
  }

  Tetromino.fromType(TetrominoType type) {
    _type = type;
    final List<String> shape = ['TTT', '.T.'];
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
