part of 'tab_bar_bloc.dart';

sealed class TabBarEvent extends Equatable {
  const TabBarEvent();

  @override
  List<Object> get props => [];
}

class TabBarClicked extends TabBarEvent {
  final int index;

  const TabBarClicked({required this.index});

  @override
  List<Object> get props => [index];
}
