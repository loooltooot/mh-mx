import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/matrix_bloc.dart';

class Cell extends StatefulWidget {
  final int value;
  final int rowNum;
  final int colNum;
  const Cell({Key? key,
    required this.value,
    required this.rowNum,
    required this.colNum}) : super(key: key);

  @override
  State<Cell> createState() => _CellState();
}

class _CellState extends State<Cell> {
  @override
  Widget build(BuildContext context) {
    Bloc _bloc = context.read<MatrixBloc>();

    return Container(
      width: 50,
      height: 40,
      margin: const EdgeInsets.only(left: 3, right: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        initialValue: widget.value != 0 ? widget.value.toString() : '',
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: 'x',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none
          )
        )
      ),
    );
  }
}
