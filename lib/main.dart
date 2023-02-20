import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'cubit/outlier_cubit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OutlierCubit>(
      create: (context) => OutlierCubit(),
      child: const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<OutlierCubit, OutlierState>(
          builder: (context, state) {
            return state.wasExecuted
                ? Column(
                    children: [
                      Text('${state.number}'),
                      ElevatedButton(
                        onPressed: () {
                          _textEditingController.clear();
                          BlocProvider.of<OutlierCubit>(context).tryAgain();
                        },
                        child: Text(AppLocalizations.of(context)!.tryAgain),
                      )
                    ],
                  )
                : Column(
                    children: [
                      TextField(
                        controller: _textEditingController,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final stringList =
                              _textEditingController.text.split(',');
                          final listOfNumbers =
                              stringList.map((e) => int.parse(e)).toList();
                          BlocProvider.of<OutlierCubit>(context)
                              .findOutlier(listOfNumbers);
                        },
                        child: Text(AppLocalizations.of(context)!.search),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
