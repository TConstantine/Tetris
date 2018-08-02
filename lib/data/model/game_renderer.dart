import 'package:flutter/material.dart';
import 'package:tetris/ui/model/block_view_model.dart';

class GameRenderer extends CustomPainter {
  List<List<BlockViewModel>> _drawable;

  void setDrawable(List<List<BlockViewModel>> drawable) {
    _drawable = drawable;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final int rows = _drawable.length;
    final int columns = _drawable[0].length;
    final double sizeWidth = size.width / columns;
    for (int row = 0; row < rows; row++) {
      for (int column = 0; column < columns; column++) {
        if (!_drawable[row][column].isEmpty()) {
          canvas.drawRect(
            Rect.fromLTWH(column * sizeWidth, row * sizeWidth, sizeWidth, sizeWidth),
            Paint()..color = Colors.black,
          );
          canvas.drawRect(
            Rect.fromLTWH(
                column * sizeWidth + 1, row * sizeWidth + 1, sizeWidth - 2, sizeWidth - 2),
            Paint()..color = _drawable[row][column].color(),
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