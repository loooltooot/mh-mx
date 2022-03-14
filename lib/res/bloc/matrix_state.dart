part of 'matrix_bloc.dart';

@immutable
abstract class MatrixState {}

class MatrixInitial extends MatrixState {}

class MatrixLoading extends MatrixState {}

class MatrixEnded extends MatrixState {
  List<List<int>> matrix;
  MatrixEnded(this.matrix);
}

class MatrixError extends MatrixState {}
