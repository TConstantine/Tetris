import 'package:test/test.dart';
import 'package:tetris/data/model/tetromino.dart';
import 'package:tetris/domain/converters/tetromino_converter.dart';
import 'package:tetris/ui/model/drawable_grid.dart';

void main() {
  TetrominoConverter _converter;

  setUp(() {
    _converter = TetrominoConverter();
  });

  test('Convert a tetromino model to a tetromino view model', () {
    final List<String> shape = ['TTT', '.T.'];
    final Tetromino tetromino = Tetromino(shape);

    final DrawableGrid drawableGrid = _converter.convertToViewModel(tetromino);

    expect(drawableGrid.rows(), 2);
    expect(drawableGrid.columns(), 3);
  });
}