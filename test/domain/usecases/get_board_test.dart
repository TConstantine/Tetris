import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:tetris/data/model/game.dart';
import 'package:tetris/domain/converters/board_converter.dart';
import 'package:tetris/domain/usecases/get_board.dart';

import '../../util/data_builder.dart';

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
    final board = DataBuilder.board();
    when(_game.board()).thenReturn(board);

    _useCase.execute();

    verify(_boardConverter.convertToViewModel(board));
  });
}
