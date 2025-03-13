import 'package:flutter_bloc/flutter_bloc.dart';

class DropdownCubit<T> extends Cubit<T?> {
  DropdownCubit() : super(null);

  void selectValue(T value) => emit(value);
}
