import 'package:test/test.dart';
import 'package:tetris/data/model/tetromino.dart';
import 'package:tetris/domain/converters/tetromino_converter.dart';
import 'package:tetris/ui/model/tetromino_view_model.dart';

void main() {
  TetrominoConverter _converter;

  setUp(() {
    _converter = TetrominoConverter();
  });

  test('Convert a tetromino model to a tetromino view model', () {
    final List<String> shape = ['TTT', '.T.'];
    final Tetromino tetromino = Tetromino(shape);

    final TetrominoViewModel tetrominoViewModel = _converter.convertToViewModel(tetromino);

    expect(tetrominoViewModel.rows(), 2);
    expect(tetrominoViewModel.columns(), 3);
  });
}