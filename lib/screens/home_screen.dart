import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../state_management/auth_provider.dart';
import '../state_management/bike_provider.dart';
import '../state_management/bike_list_provider.dart';
import '../state_management/theme_provider.dart';
import '../widgets/bike_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bikesAsyncValue = ref.watch(filteredBikesProvider);
    final currentSort = ref.watch(sortOptionProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bike & Scooter Rental'),
        actions: [
          PopupMenuButton<SortOption>(
            icon: const Icon(Icons.sort),
            initialValue: currentSort,
            onSelected: (SortOption result) {
              ref.read(sortOptionProvider.notifier).updateOption(result);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<SortOption>>[
              CheckedPopupMenuItem<SortOption>(
                value: SortOption.ratingDesc,
                checked: currentSort == SortOption.ratingDesc,
                child: const Text('Sort by Rating (Highest)'),
              ),
              CheckedPopupMenuItem<SortOption>(
                value: SortOption.priceAsc,
                checked: currentSort == SortOption.priceAsc,
                child: const Text('Sort by Price (Lowest)'),
              ),
              CheckedPopupMenuItem<SortOption>(
                value: SortOption.priceDesc,
                checked: currentSort == SortOption.priceDesc,
                child: const Text('Sort by Price (Highest)'),
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              ref.watch(themeModeProvider) == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              ref.read(themeModeProvider.notifier).toggleTheme();
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authStateProvider.notifier).logout();
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) => ref.read(searchQueryProvider.notifier).updateQuery(value),
              decoration: InputDecoration(
                hintText: 'Search bikes...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(bikesProvider);
              },
              child: bikesAsyncValue.when(
                data: (bikes) {
                  if (bikes.isEmpty) {
                    return ListView(
                      children: const [
                        SizedBox(height: 100),
                        Center(child: Text('No bikes found.')),
                      ],
                    );
                  }
                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: bikes.length,
                    itemBuilder: (context, index) {
                      final bike = bikes[index];
                      return BikeCard(
                        bike: bike,
                        onTap: () {
                          context.push('/details', extra: bike);
                        },
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => ListView(
                  children: [
                    const SizedBox(height: 100),
                    Center(child: Text('Error: $error')),
                    TextButton(
                      onPressed: () => ref.invalidate(bikesProvider),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
