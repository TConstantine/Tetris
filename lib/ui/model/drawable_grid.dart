import 'package:flutter/material.dart';

abstract class DrawableGrid {
  int rows();
  int columns();
  bool isEmptyAt(int row, int column);
  Color colorAt(int row, int column);
}