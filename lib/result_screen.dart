import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './cubit/outlier_cubit.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocBuilder<OutlierCubit, OutlierState>(
            builder: (context, state) {
              return Text('${state.number}');
            },
          ),
        ),
      ),
    );
  }
}
