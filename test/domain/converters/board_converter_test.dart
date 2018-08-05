import 'package:test/test.dart';
import 'package:tetris/data/model/board.dart';
import 'package:tetris/domain/converters/board_converter.dart';
import 'package:tetris/ui/model/grid_view_model.dart';

void main() {
  BoardConverter _converter;

  setUp(() {
    _converter = BoardConverter();
  });

  test('Convert a board model to a board view model', () {
    final Board board = Board(1, 2);

    final GridViewModel drawableGrid = _converter.convertToViewModel(board);

    expect(drawableGrid.rows(), 1);
    expect(drawableGrid.columns(), 2);
  });
}