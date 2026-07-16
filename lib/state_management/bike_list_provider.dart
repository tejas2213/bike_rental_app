import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/bike_model.dart';
import 'bike_provider.dart';

enum SortOption { priceAsc, priceDesc, ratingDesc }

final searchQueryProvider = StateProvider<String>((ref) => '');
final sortOptionProvider = StateProvider<SortOption>((ref) => SortOption.ratingDesc);

final filteredBikesProvider = Provider<AsyncValue<List<BikeModel>>>((ref) {
  final bikesAsync = ref.watch(bikesProvider);
  final query = ref.watch(searchQueryProvider).toLowerCase();
  final sortOption = ref.watch(sortOptionProvider);

  return bikesAsync.whenData((bikes) {
    var filtered = bikes.where((bike) => bike.title.toLowerCase().contains(query)).toList();

    filtered.sort((a, b) {
      switch (sortOption) {
        case SortOption.priceAsc:
          return a.pricePerDay.compareTo(b.pricePerDay);
        case SortOption.priceDesc:
          return b.pricePerDay.compareTo(a.pricePerDay);
        case SortOption.ratingDesc:
          return b.rating.compareTo(a.rating);
      }
    });

    return filtered;
  });
});
