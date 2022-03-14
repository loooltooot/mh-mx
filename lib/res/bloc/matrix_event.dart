part of 'matrix_bloc.dart';

@immutable
abstract class MatrixEvent {}

class MatrixIncrease extends MatrixEvent {}

class MatrixDecrease extends MatrixEvent {}

class MatrixGet extends MatrixEvent {}

class MatrixInsert extends MatrixEvent {
  int value, rowNum, colNum;
  MatrixInsert(this.value, this.rowNum, this.colNum);
}
