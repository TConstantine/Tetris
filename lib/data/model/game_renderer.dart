import 'package:flutter/material.dart';
import 'package:tetris/ui/model/tetromino_view_model.dart';

class GameRenderer extends CustomPainter {
  TetrominoViewModel _drawable;

  void setDrawable(TetrominoViewModel drawable) {
    _drawable = drawable;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final int rows = _drawable.rows();
    final int columns = _drawable.columns();
    final double sizeWidth = size.width / columns;
    for (int row = 0; row < rows; row++) {
      for (int column = 0; column < columns; column++) {
        if (!_drawable.isEmptyAt(row, column)) {
          canvas.drawRect(
            Rect.fromLTWH(column * sizeWidth, row * sizeWidth, sizeWidth, sizeWidth),
            Paint()..color = Colors.black,
          );
          canvas.drawRect(
            Rect.fromLTWH(
                column * sizeWidth + 1, row * sizeWidth + 1, sizeWidth - 2, sizeWidth - 2),
            Paint()..color = _drawable.colorAt(row, column),
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