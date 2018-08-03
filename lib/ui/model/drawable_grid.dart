import 'package:flutter/material.dart';

class DrawableGrid {
  final List<List<Color>> _cells;

  DrawableGrid(this._cells);

  int rows() {
    return _cells.length;
  }

  int columns() {
    return _cells[0].length;
  }

  bool isVisibleAt(int row, int column) {
    return _cells[row][column] != Colors.transparent;
  }

  Color colorAt(int row, int column) {
    return _cells[row][column];
  }
}
