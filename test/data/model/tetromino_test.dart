import 'package:test/test.dart';
import 'package:tetris/data/model/tetromino.dart';
import 'package:tetris/data/model/tetromino_type.dart';

void main() {
  test('Created tetromino has the correct type', () {
    final Tetromino tetrominoI = Tetromino.I;
    expect(tetrominoI.type(), TetrominoType.I);
    final Tetromino tetrominoJ = Tetromino.J;
    expect(tetrominoJ.type(), TetrominoType.J);
    final Tetromino tetrominoL = Tetromino.L;
    expect(tetrominoL.type(), TetrominoType.L);
    final Tetromino tetrominoO = Tetromino.O;
    expect(tetrominoO.type(), TetrominoType.O);
    final Tetromino tetrominoS = Tetromino.S;
    expect(tetrominoS.type(), TetrominoType.S);
    final Tetromino tetrominoT = Tetromino.T;
    expect(tetrominoT.type(), TetrominoType.T);
    final Tetromino tetrominoZ = Tetromino.Z;
    expect(tetrominoZ.type(), TetrominoType.Z);
  });
}