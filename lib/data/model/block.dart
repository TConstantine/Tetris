class Block {
  static const String EMPTY = ' ';
  final String _value;

  Block(this._value);

  String value() {
    return _value;
  }

  bool isEmpty() {
    return _value == EMPTY;
  }
}