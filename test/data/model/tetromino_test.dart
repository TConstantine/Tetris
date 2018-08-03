import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:tetris/data/model/string_matcher.dart';
import 'package:tetris/data/model/tetromino.dart';
import 'package:tetris/data/model/tetromino_type.dart';

class StringMatcherMock extends Mock implements StringMatcher {}

void main() {
  TetrominoType _tetrominoType;
  StringMatcher _stringMatcher;
  Tetromino _tetromino;

  setUp(() {
    _tetrominoType = TetrominoType.T;
    _stringMatcher = StringMatcherMock();
    when(_stringMatcher.matchToString(_tetrominoType)).thenReturn(['???', ' ? ']);
    _tetromino = Tetromino(_tetrominoType, _stringMatcher);
  });

  test('Created tetromino has the correct type', () {
    expect(_tetromino.type(), _tetrominoType);
  });

  test('Created tetromino has the correct string representation', () {
    verify(_stringMatcher.matchToString(_tetromino.type()));
  });
}