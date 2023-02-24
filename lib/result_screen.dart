import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import './cubit/outlier_cubit.dart';
import './page_layout.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Center(
        child: BlocBuilder<OutlierCubit, OutlierState>(
          builder: (context, state) {
            return state.wasExecuted
                ? Text('${state.number}')
                : Text(AppLocalizations.of(context)!.errorMessage);
          },
        ),
      ),
    );
  }
}
