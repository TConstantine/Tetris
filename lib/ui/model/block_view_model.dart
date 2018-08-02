import 'package:flutter/material.dart';

class BlockViewModel {
  final bool _isEmpty;
  final Color _color;

  BlockViewModel(this._isEmpty, this._color);

  bool isEmpty() => _isEmpty;
  
  Color color() => _color;
  
  @override
  bool operator ==(other) => other is BlockViewModel && other._isEmpty == _isEmpty && other._color == _color;

  @override
  int get hashCode => super.hashCode;
}