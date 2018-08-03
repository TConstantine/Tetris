import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:tetris/data/model/board.dart';
import 'package:tetris/data/model/game.dart';
import 'package:tetris/domain/converters/board_converter.dart';
import 'package:tetris/domain/usecases/get_board.dart';
import 'package:tetris/ui/model/board_view_model.dart';

class GameMock extends Mock implements Game {}

class BoardConverterMock extends Mock implements BoardConverter {}

void main() {
  Game _game;
  BoardConverter _boardConverter;
  GetBoard _useCase;

  setUp(() {
    _game = GameMock();
    _boardConverter = BoardConverterMock();
    _useCase = GetBoard(_game, _boardConverter);
  });

  test('Get the board', () {
    final Board board = Board(0, 0);
    when(_game.board()).thenReturn(board);
    final BoardViewModel boardViewModel = BoardViewModel([]);
    when(_boardConverter.convertToViewModel(board)).thenReturn(boardViewModel);

    final BoardViewModel actual = _useCase.execute();

    expect(actual, boardViewModel);
  });
}