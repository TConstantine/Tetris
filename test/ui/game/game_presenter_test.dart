import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:tetris/data/model/game.dart';
import 'package:tetris/data/model/game_renderer.dart';
import 'package:tetris/ui/game/game_contract.dart';
import 'package:tetris/ui/game/game_presenter.dart';
import 'package:tetris/ui/model/block_view_model.dart';

class GameViewMock extends Mock implements GameContractView {}
class GameMock extends Mock implements Game {}
class GameRendererMock extends Mock implements GameRenderer {}

void main() {
  GameContractView _view;
  Game _game;
  GameRenderer _renderer;
  GameContractPresenter _presenter;

  setUp(() {
    _view = GameViewMock();
    _game = GameMock();
    _renderer = GameRendererMock();
    _presenter = GamePresenter(_view, _game, _renderer);
  });

  test('Display next tetromino', () {
    final List<List<BlockViewModel>> nextTetromino = [
      [
        BlockViewModel(false, Colors.red),
        BlockViewModel(false, Colors.red),
        BlockViewModel(false, Colors.red)
      ],
      [
        BlockViewModel(true, Colors.red),
        BlockViewModel(false, Colors.red),
        BlockViewModel(true, Colors.red)
      ]
    ];
    when(_game.nextTetromino()).thenReturn(nextTetromino);

    _presenter.startNewGame();

    verify(_view.renderNextTetromino(_renderer));
  });
}
