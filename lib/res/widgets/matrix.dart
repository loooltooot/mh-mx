import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhmx/res/widgets/matrix_cell.dart';

import '../bloc/matrix_bloc.dart';

class MatrixWidget extends StatefulWidget {
  final String title;
  const MatrixWidget({Key? key, required this.title}) : super(key: key);

  @override
  State<MatrixWidget> createState() => _MatrixWidgetState();
}

class _MatrixWidgetState extends State<MatrixWidget> {
  @override
  Widget build(BuildContext context) {
    Bloc _bloc = context.read<MatrixBloc>();
    _bloc.add(MatrixGet());

    return Column(
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10)
        ),
        BlocBuilder<MatrixBloc, MatrixState>(
          builder: (_, state) {
            if(state is MatrixEnded) {
              return Column(
                children: state.matrix.map((row) => Row(
                  children: row.map((e) => Cell(
                    value: e,
                    rowNum: state.matrix.indexOf(row),
                    colNum: row.indexOf(e))).toList(),
                  )
                ).toList(),
              );
            }

            return CircularProgressIndicator();
          }
        ),
      ],
    );
  }
}
