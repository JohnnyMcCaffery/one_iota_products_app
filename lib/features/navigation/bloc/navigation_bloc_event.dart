part of 'navigation_bloc.dart';

abstract class NavigationBlocEvent {}

final class NavigationSetActivePage extends NavigationBlocEvent {
  final int activeIndex;

  NavigationSetActivePage(this.activeIndex);
}