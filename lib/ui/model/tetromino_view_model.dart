import 'package:flutter/material.dart';
import 'package:tetris/ui/model/block_view_model.dart';

class TetrominoViewModel {
  final List<List<BlockViewModel>> _shape;

  TetrominoViewModel(this._shape);

  int rows() => _shape.length;

  int columns() => _shape[0].length;

  bool isEmptyAt(int row, int column) => _shape[row][column].isEmpty();

  Color colorAt(int row, int column) => _shape[row][column].color();
}