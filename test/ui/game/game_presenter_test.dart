import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:tetris/data/model/game.dart';
import 'package:tetris/data/model/game_renderer.dart';
import 'package:tetris/data/model/tetromino.dart';
import 'package:tetris/domain/converters/tetromino_converter.dart';
import 'package:tetris/ui/game/game_contract.dart';
import 'package:tetris/ui/game/game_presenter.dart';
import 'package:tetris/ui/model/tetromino_view_model.dart';

class GameViewMock extends Mock implements GameContractView {}
class TetrominoConverterMock extends Mock implements TetrominoConverter {}
class GameMock extends Mock implements Game {}
class GameRendererMock extends Mock implements GameRenderer {}

void main() {
  GameContractView _view;
  TetrominoConverter _converter;
  Game _game;
  GameRenderer _renderer;
  GameContractPresenter _presenter;

  setUp(() {
    _view = GameViewMock();
    _converter = TetrominoConverterMock();
    _game = GameMock();
    _renderer = GameRendererMock();
    _presenter = GamePresenter(_view, _converter, _game, _renderer);
  });

  test('Display next tetromino', () {
    final Tetromino tetromino = Tetromino([]);
    when(_game.nextTetromino()).thenReturn(tetromino);
    final TetrominoViewModel tetrominoViewModel = TetrominoViewModel([]);
    when(_converter.convertToViewModel(tetromino)).thenReturn(tetrominoViewModel);

    _presenter.startNewGame();

    verify(_renderer.setDrawable(tetrominoViewModel));
    verify(_view.renderNextTetromino(_renderer));
  });
}
