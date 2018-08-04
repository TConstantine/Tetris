import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:tetris/data/model/string_matcher.dart';
import 'package:tetris/data/model/tetromino.dart';

import '../../util/data_builder.dart';

class StringMatcherMock extends Mock implements StringMatcher {}

void main() {
  StringMatcher _stringMatcher;
  Tetromino _tetromino;

  setUp(() {
    _stringMatcher = StringMatcherMock();
    when(_stringMatcher.matchToString(DataBuilder.tetrominoType())).thenReturn(['???', ' ? ']);
    _tetromino = Tetromino(DataBuilder.tetrominoType(), _stringMatcher);
  });

  test('Created tetromino has the correct type', () {
    expect(_tetromino.type(), DataBuilder.tetrominoType());
  });

  test('Created tetromino has the correct string representation', () {
    verify(_stringMatcher.matchToString(_tetromino.type()));
  });
}