import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class GridViewModel {
  final List<List<Color>> _cells;

  GridViewModel(this._cells);

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

  @override
  bool operator ==(other) =>
      other is GridViewModel && DeepCollectionEquality().equals(other._cells, _cells);

  @override
  int get hashCode => super.hashCode;
}
