import 'package:flutter/material.dart';
import 'package:tetris/ui/model/drawable_grid.dart';

class GridRenderer extends CustomPainter {
  DrawableGrid _grid;

  void setDrawable(DrawableGrid grid) {
    _grid = grid;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final int rows = _grid.rows();
    final int columns = _grid.columns();
    final double cellSize = size.width / columns;
    for (int row = 0; row < rows; row++) {
      for (int column = 0; column < columns; column++) {
        if (_grid.isVisibleAt(row, column)) {
          canvas.drawRect(
            Rect.fromLTWH(column * cellSize, row * cellSize, cellSize, cellSize),
            Paint()..color = Colors.black,
          );
          canvas.drawRect(
            Rect.fromLTWH(column * cellSize + 1, row * cellSize + 1, cellSize - 2, cellSize - 2),
            Paint()..color = _grid.colorAt(row, column),
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
