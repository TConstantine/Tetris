import 'package:test/test.dart';
import 'package:tetris/data/model/tetromino_type.dart';
import 'package:tetris/data/model/string_matcher.dart';

void main() {
  StringMatcher _matcher;

  setUp(() {
    _matcher = StringMatcher();
  });

  test('Matches a tetromino type to a String representation', () {
    final List<String> matchI = _matcher.matchToString(TetrominoType.I);
    final List<String> matchJ = _matcher.matchToString(TetrominoType.J);
    final List<String> matchL = _matcher.matchToString(TetrominoType.L);
    final List<String> matchO = _matcher.matchToString(TetrominoType.O);
    final List<String> matchS = _matcher.matchToString(TetrominoType.S);
    final List<String> matchT = _matcher.matchToString(TetrominoType.T);
    final List<String> matchZ = _matcher.matchToString(TetrominoType.Z);

    expect(matchI, ['????']);
    expect(matchJ, ['???', '  ?']);
    expect(matchL, ['???', '?  ']);
    expect(matchO, ['??', '??']);
    expect(matchS, [' ??', '?? ']);
    expect(matchT, ['???', ' ? ']);
    expect(matchZ, ['?? ', ' ??']);
  });

  test('Passing a wrong tetromino type throws exception', () {
    expect(() => _matcher.matchToString(null), throwsArgumentError);
  });
}
