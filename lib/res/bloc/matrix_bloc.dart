import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mhmx/res/models/matrix.dart';

part 'matrix_event.dart';
part 'matrix_state.dart';

class MatrixBloc extends Bloc<MatrixEvent, MatrixState> {
  final Matrix _matrix = Matrix(3, 3);

  MatrixBloc() : super(MatrixInitial()) {
    on<MatrixGet>((event, emit) {
      emit(MatrixEnded(_matrix.matrix));
    });
    on<MatrixIncrease>((event, emit) {
      if(_matrix.rows + 1 < 7) {
        _matrix.resizeMatrix(_matrix.rows + 1, _matrix.columns + 1, false);
      }
    });
    on<MatrixDecrease>((event, emit) {
      if(_matrix.rows - 1 >= 2) {
        _matrix.resizeMatrix(_matrix.rows - 1, _matrix.columns - 1, false);
      }
    });
    on<MatrixInsert>((event, emit) {
      _matrix.insertValue(event.value, event.rowNum, event.colNum);
    });
  }
}
