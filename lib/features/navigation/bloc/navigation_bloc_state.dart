part of 'navigation_bloc.dart';

abstract class NavigationBlocState {
  int activeIndex;

  NavigationBlocState({this.activeIndex = 0});
}

final class NavigationInit extends NavigationBlocState {
}


final class NavigationSetIndex extends NavigationBlocState {
  NavigationSetIndex(activeIndex){
    super.activeIndex = activeIndex;
  }
}
