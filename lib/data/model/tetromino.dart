class Tetromino {
  static const Tetromino T = Tetromino(['TTT', '.T.']);
  final List<String> _shape;

  const Tetromino(this._shape);

  int rows() {
    return _shape.length;
  }

  int columns() {
    return _shape[0].length;
  }

  String blockAt(int row, int column) {
    return _shape[row].substring(column, column + 1);
  }
}