import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/bike_model.dart';
import '../core/app_colors.dart';

class BikeDetailsScreen extends StatelessWidget {
  final BikeModel bike;
  const BikeDetailsScreen({super.key, required this.bike});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(bike.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'bike_image_${bike.id}',
              child: CachedNetworkImage(
                imageUrl: bike.image,
                height: 300,
                fit: BoxFit.contain,
              ),
            ).animate().fadeIn(duration: 500.ms).scale(begin: const Offset(0.9, 0.9)),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          bike.title,
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 24),
                        ),
                      ),
                      Text(
                        '\$${bike.pricePerDay.toStringAsFixed(2)}/d',
                        style: const TextStyle(color: AppColors.primary, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ).animate().slideX(begin: 0.1, duration: 400.ms),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text('${bike.rating} (${bike.reviewCount} reviews)'),
                    ],
                  ).animate().fadeIn(delay: 200.ms),
                  const SizedBox(height: 24),
                  Text('Description', style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(bike.description, style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 24),
                  Text('Pickup Location', style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: const GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(37.42796133580664, -122.085749655962),
                          zoom: 14.4746,
                        ),
                        liteModeEnabled: true,
                      ),
                    ),
                  ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: bike.isAvailable
                ? () {
                    context.push('/booking', extra: bike);
                  }
                : null,
            child: Text(bike.isAvailable ? 'Book Now' : 'Unavailable'),
          ),
        ),
      ),
    );
  }
}
