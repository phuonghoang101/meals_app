import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_with_riverpod/models/meal.dart';

class FavouriteMealNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealNotifier() : super([]);
  bool toggleMealFavouriteStatus(Meal meal){
    final mealIsFavourite = state.contains(meal);
    if(mealIsFavourite){
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }else{
      state = [...state, meal];
      return true;
    }
  }
}

final favouritesProvider = StateNotifierProvider<FavouriteMealNotifier, List<Meal>>((ref)  {
  return FavouriteMealNotifier();
});
