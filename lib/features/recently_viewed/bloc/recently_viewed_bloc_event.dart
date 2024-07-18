part of 'recently_viewed_bloc.dart';

abstract class RecentlyViewedBlocEvent {}

final class RecentlyViewed extends RecentlyViewedBlocEvent {
  final int productId;
  
  RecentlyViewed(this.productId);
}