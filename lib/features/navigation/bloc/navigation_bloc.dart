import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_bloc_event.dart';
part 'navigation_bloc_state.dart';

class NavigationBloc extends Bloc<NavigationBlocEvent, NavigationBlocState> {
  NavigationBloc():super(NavigationInit()){
    on<NavigationSetActivePage>((event, emit) => _setActiveRoute(event, emit),);
  }

  void _setActiveRoute(event, emit){
    emit(NavigationSetIndex(event.activeIndex));
  }
}