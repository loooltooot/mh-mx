import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mhmx/res/widgets/matrixes_container.dart';

import '../bloc/matrix_bloc.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.appBarTitle
        ),
        elevation: 0,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24
        ),
      ),
      body: Column(
        children: [
          BlocProvider(
            create: (_) => MatrixBloc(),
            child: const MatrixesContainer(),
          )
        ],
      )
    );
  }
}
