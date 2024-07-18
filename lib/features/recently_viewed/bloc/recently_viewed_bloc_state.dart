part of 'recently_viewed_bloc.dart';

abstract class RecentlyViewedBlocState {
  RecentlyViewedBlocState({required this.recentlyViewedProducts});

  List<int> recentlyViewedProducts;
}

final class RecentlyViewedInit extends RecentlyViewedBlocState {
  RecentlyViewedInit({required super.recentlyViewedProducts});
}

final class AddToRecentlyViewed extends RecentlyViewedBlocState {
  AddToRecentlyViewed({required super.recentlyViewedProducts});
}