import 'package:flutter/material.dart';
import 'package:tetris/ui/model/block_view_model.dart';

class GameRenderer extends CustomPainter {
  final List<List<BlockViewModel>> _blocks;

  GameRenderer(this._blocks);

  @override
  void paint(Canvas canvas, Size size) {
    final int rows = _blocks.length;
    final int columns = _blocks[0].length;
    final double sizeWidth = size.width / columns;
    for (int row = 0; row < rows; row++) {
      for (int column = 0; column < columns; column++) {
        if (!_blocks[row][column].isEmpty()) {
          canvas.drawRect(
            Rect.fromLTWH(column * sizeWidth, row * sizeWidth, sizeWidth, sizeWidth),
            Paint()..color = Colors.black,
          );
          canvas.drawRect(
            Rect.fromLTWH(
                column * sizeWidth + 1, row * sizeWidth + 1, sizeWidth - 2, sizeWidth - 2),
            Paint()..color = _blocks[row][column].color(),
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