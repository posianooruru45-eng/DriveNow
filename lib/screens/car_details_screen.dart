import 'package:flutter/material.dart';

import '../models/car.dart';
import '../theme/app_theme.dart';
import '../widgets/primary_button.dart';

/// Car details screen � full information about a single [Car].
class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({super.key, required this.car});

  static const routeName = '/car-details';

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: Text(car.make),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Car image hero � full width, full vehicle visible (no crop)
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 320,
                    color: AppTheme.surface,
                    child: Center(
                      child: Image.asset(
                        car.image,
                        height: 290,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => Container(
                          width: double.infinity,
                          height: 290,
                          color: const Color(0xFFF0F4F8),
                          child: const Icon(
                            Icons.directions_car,
                            size: 90,
                            color: Color(0xFF9AA5B1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.55),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.local_atm,
                            color: Colors.amber,
                            size: 18,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            car.displayPrice,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (!car.available)
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Unavailable',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),

              // Car details content
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            car.fullName,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(fontWeight: FontWeight.w800),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: AppTheme.primary,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${car.year}  \u2022  ${car.seats} seats  \u2022  ${car.transmission}  \u2022  ${car.fuelType}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppTheme.textMuted),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'About this car',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textDark,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      car.description,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(height: 1.5),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Features',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textDark,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: car.features
                          .map(
                            (feature) => Chip(
                              label: Text(
                                feature,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              backgroundColor: const Color(0xFFF0F4F8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Specifications',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textDark,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _SpecRow(
                      icon: Icons.directions_car,
                      label: 'Transmission',
                      value: car.transmission,
                    ),
                    _SpecRow(
                      icon: Icons.local_gas_station,
                      label: 'Fuel type',
                      value: car.fuelType,
                    ),
                    _SpecRow(
                      icon: Icons.event_seat,
                      label: 'Seats',
                      value: '${car.seats} passengers',
                    ),
                    _SpecRow(
                      icon: Icons.build,
                      label: 'Year',
                      value: '${car.year}',
                    ),
                    _SpecRow(
                      icon: Icons.category,
                      label: 'Category',
                      value: car.category,
                    ),
                    const SizedBox(height: 30),
                    PrimaryButton(
                      onPressed: car.available
                          ? () {
                              Navigator.of(context).pushNamed(
                                '/booking',
                                arguments: car,
                              );
                            }
                          : null,
                      child: const Text('Book Now'),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SpecRow extends StatelessWidget {
  const _SpecRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 20, color: AppTheme.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppTheme.textMuted),
            ),
          ),
          Text(
            value,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600, color: AppTheme.textDark),
          ),
        ],
      ),
    );
  }
}
