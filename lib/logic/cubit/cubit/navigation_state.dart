part of 'navigation_cubit.dart';

@immutable
class NavigationState {
  int index;
  NavigationState({required this.index});
}

class PageChange extends NavigationState {
  final int index;
  PageChange({required this.index}) : super(index: index);
}
