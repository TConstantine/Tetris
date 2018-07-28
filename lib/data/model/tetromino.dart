class Tetromino {
  static const Tetromino T = Tetromino(['TTT', '.T.']);
  static const String _EMPTY = '.';
  final List<String> _shape;

  const Tetromino(this._shape);

  int rows() {
    return _shape.length;
  }

  int columns() {
    return _shape[0].length;
  }

  bool isEmptyAt(int row, int column) {
    return blockAt(row, column) == _EMPTY;
  }

  String blockAt(int row, int column) {
    return _shape[row].substring(column, column + 1);
  }
}