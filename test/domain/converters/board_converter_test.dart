import 'package:test/test.dart';
import 'package:tetris/data/model/board.dart';
import 'package:tetris/domain/converters/board_converter.dart';
import 'package:tetris/ui/model/board_view_model.dart';

void main() {
  BoardConverter _converter;

  setUp(() {
    _converter = BoardConverter();
  });

  test('Convert a board model to a board view model', () {
    final Board board = Board(1, 2);

    final BoardViewModel boardViewModel = _converter.convertToViewModel(board);

    expect(boardViewModel.rows(), 1);
    expect(boardViewModel.columns(), 2);
  });
}