import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:tetris/data/model/game.dart';
import 'package:tetris/ui/game/game_contract.dart';
import 'package:tetris/ui/game/game_presenter.dart';
import 'package:tetris/ui/model/block_view_model.dart';

class GameMock extends Mock implements Game {}

void main() {
  Game _game;
  GameContractPresenter _presenter;

  setUp(() {
    _game = GameMock();
    _presenter = GamePresenter(_game);
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

    _presenter.nextTetrominoRenderer();

    verify(_game.nextTetromino());
  });
}
