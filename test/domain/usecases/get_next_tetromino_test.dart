import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:tetris/data/model/game.dart';
import 'package:tetris/data/model/tetromino.dart';
import 'package:tetris/domain/converters/tetromino_converter.dart';
import 'package:tetris/domain/usecases/get_next_tetromino.dart';
import 'package:tetris/ui/model/tetromino_view_model.dart';

class GameMock extends Mock implements Game {}
class TetrominoConverterMock extends Mock implements TetrominoConverter {}

void main() {
  Game _game;
  TetrominoConverter _converter;
  GetNextTetromino _useCase;

  setUp(() {
    _game = GameMock();
    _converter = TetrominoConverterMock();
    _useCase = GetNextTetromino(_game, _converter);
  });

  test('Get next tetromino', () {
    final Tetromino tetromino = Tetromino([]);
    when(_game.nextTetromino()).thenReturn(tetromino);
    final TetrominoViewModel tetrominoViewModel = TetrominoViewModel([]);
    when(_converter.convertToViewModel(tetromino)).thenReturn(tetrominoViewModel);

    _useCase.execute();

    verifyInOrder([
      _game.nextTetromino(),
      _converter.convertToViewModel(tetromino)
    ]);
  });
}