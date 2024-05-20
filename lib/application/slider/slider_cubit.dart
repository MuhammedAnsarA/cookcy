import 'package:flutter_bloc/flutter_bloc.dart';

class SliderCubit extends Cubit<double> {
  SliderCubit() : super(10);

  void updateSlider(double value) {
    emit(value);
  }
}
