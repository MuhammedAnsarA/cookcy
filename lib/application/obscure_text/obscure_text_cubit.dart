import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'obscure_text_state.dart';

class ObscureTextCubit extends Cubit<ObscureTextState> {
  ObscureTextCubit() : super(const ObscureTextState(true));

  void toggleObscuring() {
    emit(ObscureTextState(!state.isObscured));
  }
}
