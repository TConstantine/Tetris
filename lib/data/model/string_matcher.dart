import 'package:tetris/data/model/tetromino_type.dart';

class StringMatcher {
  static final StringMatcher _instance = new StringMatcher._internal();

  StringMatcher._internal();

  factory StringMatcher() {
    return _instance;
  }

  List<String> matchToString(TetrominoType type) {
    switch (type) {
      case TetrominoType.I:
        return ['????'];
      case TetrominoType.J:
        return ['???', '  ?'];
      case TetrominoType.L:
        return ['???', '?  '];
      case TetrominoType.O:
        return ['??', '??'];
      case TetrominoType.S:
        return [' ??', '?? '];
      case TetrominoType.T:
        return ['???', ' ? '];
      case TetrominoType.Z:
        return ['?? ', ' ??'];
      default:
        throw ArgumentError();
    }
  }
}
