import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

enum Gender { male, female }

class GenderCubit extends Cubit<Gender?> {
  bool hasError = false;
  GenderCubit() : super(null);

  void selectGender(Gender gender) {
    emit(gender);
  }

  void showValidationError() {
    hasError = true;
    emit(state); // Re-emit state to trigger UI update
  }
}
