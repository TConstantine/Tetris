import 'package:test/test.dart';
import 'package:tetris/domain/converters/tetromino_converter.dart';
import 'package:tetris/ui/model/grid_view_model.dart';

import '../../util/data_builder.dart';

void main() {
  TetrominoConverter _converter;

  setUp(() {
    _converter = TetrominoConverter();
  });

  test('Convert a tetromino model to a tetromino view model', () {
    final GridViewModel drawableGrid = _converter.convertToViewModel(DataBuilder.tetromino());

    expect(drawableGrid.rows(), 2);
    expect(drawableGrid.columns(), 3);
  });
}