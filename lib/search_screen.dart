import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import './result_screen.dart';
import './cubit/outlier_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
            ),
            ElevatedButton(
              onPressed: () {
                final stringList = _textEditingController.text.split(',');
                final listOfNumbers =
                    stringList.map((e) => int.parse(e)).toList();
                BlocProvider.of<OutlierCubit>(context)
                    .findOutlier(listOfNumbers);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ResultScreen(),
                  ),
                );
              },
              child: Text(AppLocalizations.of(context)!.search),
            ),
          ],
        ),
      ),
    );
  }
}
