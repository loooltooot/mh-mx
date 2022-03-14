import 'package:flutter/material.dart';
import 'package:mhmx/res/bloc/matrix_bloc.dart';
import 'package:mhmx/res/widgets/matrix.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatrixesContainer extends StatefulWidget {
  const MatrixesContainer({Key? key}) : super(key: key);

  @override
  State<MatrixesContainer> createState() => _MatrixesContainerState();
}

class _MatrixesContainerState extends State<MatrixesContainer> {
  double _opacity = 1;
  double _padding = 20;

  @override
  Widget build(BuildContext context) {
    Bloc _bloc = context.read<MatrixBloc>();

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 700),
      opacity: _opacity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MatrixWidget(title: 'A',),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          Container(
            width: 101,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.fromBorderSide(BorderSide(
                color: Theme.of(context).colorScheme.onBackground,
                width: 2.5
              ))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    _animateMatrix();
                    await Future.delayed(Duration(milliseconds: 700), () {
                      _bloc.add(MatrixDecrease());
                    });
                  },
                  padding: const EdgeInsets.all(3),
                  splashRadius: 20,
                  icon: const Icon(Icons.remove)
                ),
                IconButton(
                  onPressed: () async {
                    _animateMatrix();
                    await Future.delayed(Duration(milliseconds: 700), () {
                      _bloc.add(MatrixIncrease());
                    });
                  },
                  padding: const EdgeInsets.all(3),
                  splashRadius: 20,
                  icon: const Icon(Icons.add)
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _animateMatrix() async {
    setState(() {
      _opacity = 0;
    });

    await Future.delayed(Duration(milliseconds: 700));

    setState(() {
      _opacity = 1;
    });
  }
}
