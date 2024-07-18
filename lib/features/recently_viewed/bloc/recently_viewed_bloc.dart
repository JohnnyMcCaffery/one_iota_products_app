import 'package:flutter_bloc/flutter_bloc.dart';

part 'recently_viewed_bloc_event.dart';
part 'recently_viewed_bloc_state.dart';

class RecentlyViewedBloc extends Bloc<RecentlyViewedBlocEvent, RecentlyViewedBlocState>{
  RecentlyViewedBloc() : super(RecentlyViewedInit(recentlyViewedProducts: [])){
    on<RecentlyViewed>((event, emit) => _addToRecentlyViewed(event,emit),);
  }

  void _addToRecentlyViewed(event,emit){

    if(
      state.recentlyViewedProducts.isEmpty ||
      !state.recentlyViewedProducts.contains(event.productId)
    ){
      state.recentlyViewedProducts.insert(0,event.productId);
    } 

    emit(AddToRecentlyViewed(recentlyViewedProducts: state.recentlyViewedProducts));
  }
}