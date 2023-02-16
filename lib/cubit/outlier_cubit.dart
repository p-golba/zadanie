import 'package:bloc/bloc.dart';

part 'outlier_state.dart';

class OutlierCubit extends Cubit<OutlierState> {
  OutlierCubit() : super(OutlierState(number: 0));

  void findOutlier(List<int> listOfNumbers) {
    if (listOfNumbers.length < 3) return;
    final result = listOfNumbers.firstWhere(
      (element) => _searchForEven(listOfNumbers) ? element.isEven : element.isOdd,
    );
    emit(OutlierState(number: result, wasExecuted: true));
  }

  bool _searchForEven(List<int> listOfNumbers) {
    int isEven = 0;
    for (int i = 0; i < 3; i++) {
      if (listOfNumbers[i].isEven) {
        isEven++;
      }
    }
    return isEven < 2;
  }
}
