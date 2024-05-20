import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_bar_event.dart';
part 'tab_bar_state.dart';

class TabBarBloc extends Bloc<TabBarEvent, TabBarState> {
  int currentIndex = 0;
  TabBarBloc() : super(TabBarInitial()) {
    on<TabBarClicked>((event, emit) {
      currentIndex = event.index;
      emit(TabBarSelected(index: event.index));
    });
  }
}
