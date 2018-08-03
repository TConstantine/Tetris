import 'package:tetris/data/model/tetromino_type.dart';

class StringMatcher {
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
