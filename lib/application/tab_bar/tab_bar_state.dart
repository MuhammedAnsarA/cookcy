part of 'tab_bar_bloc.dart';

sealed class TabBarState extends Equatable {
  const TabBarState();

  @override
  List<Object> get props => [];
}

class TabBarInitial extends TabBarState {}

class TabBarSelected extends TabBarState {
  final int index;

  const TabBarSelected({required this.index});

  @override
  List<Object> get props => [index];
}
