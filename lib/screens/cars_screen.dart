import 'package:flutter/material.dart';

import '../data/car_data.dart';
import '../models/car.dart';
import '../theme/app_theme.dart';
import '../widgets/category_chip.dart';
import '../widgets/car_card.dart';
import 'car_details_screen.dart';

/// Cars listing screen ï¿½ shows cars in a grid with optional search or
/// category filtering.
///
/// Accepts an optional [initialFilter] route argument:
/// - a [String] search query, or
/// - a [String] category name.
class CarsScreen extends StatefulWidget {
  /// Optional initial filter passed via route arguments.
  final String? initialFilter;

  const CarsScreen({super.key, this.initialFilter});

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
  final _searchController = TextEditingController();
  String? _activeCategory;
  String? _searchQuery;

  List<Car> _filteredCars = List.from(sampleCars);

  @override
  void initState() {
    super.initState();
    _applyArguments();
  }

  /// Applies the initial route filter (category or search query).
  void _applyArguments() {
    final filter = widget.initialFilter;
    if (filter == null || filter.isEmpty) {
      _filteredCars = List.from(sampleCars);
      _activeCategory = null;
      _searchQuery = null;
      _searchController.clear();
      return;
    }

    // Check if the filter matches a category exactly
    final categoryMatch = vehicleCategories.firstWhere(
      (cat) => cat.toLowerCase() == filter.toLowerCase(),
      orElse: () => '',
    );

    if (categoryMatch.isNotEmpty) {
      setState(() {
        _activeCategory = categoryMatch;
        _searchQuery = null;
        _searchController.text = filter;
        _filteredCars = carsByCategory(categoryMatch);
      });
    } else {
      // Treat as a search query
      setState(() {
        _searchQuery = filter;
        _activeCategory = null;
        _searchController.text = filter;
        _filteredCars = searchCars(filter);
      });
    }
  }

  void _filterByCategory(String category) {
    setState(() {
      _activeCategory = category;
      _searchQuery = null;
      _searchController.clear();
      _filteredCars = carsByCategory(category);
    });
  }

  void _search(String query) {
    setState(() {
      _searchQuery = query.trim();
      _activeCategory = null;
      _filteredCars = searchCars(_searchQuery ?? '');
    });
  }

  void _showAll() {
    setState(() {
      _activeCategory = null;
      _searchQuery = null;
      _searchController.clear();
      _filteredCars = List.from(sampleCars);
    });
  }

  @override
  Widget build(BuildContext context) {
    final availableCars = _filteredCars.where((car) => car.available).toList();

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Available Cars'),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xFF1F2A44),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search by make or model\u2026',
                  prefixIcon: const Icon(Icons.search, color: Color(0xFF6C757D)),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, color: Color(0xFF6C757D)),
                          onPressed: _showAll,
                        )
                      : null,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFDEE2E6)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFDEE2E6)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppTheme.primary, width: 1.5),
                  ),
                ),
                onSubmitted: _search,
              ),
            ),
            const SizedBox(height: 12),

            // Category chips
            SizedBox(
              height: 44,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: vehicleCategories.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CategoryChip(
                        label: 'All',
                        selected: _activeCategory == null && _searchQuery == null,
                        onTap: _showAll,
                      ),
                    );
                  }
                  final category = vehicleCategories[index - 1];
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CategoryChip(
                      label: category,
                      selected: _activeCategory == category,
                      onTap: () => _filterByCategory(category),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Results header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${availableCars.length} vehicle${availableCars.length != 1 ? 's' : ''} available',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1F2A44),
                    ),
                  ),
                  if (_activeCategory != null || _searchQuery != null)
                    TextButton(
                      onPressed: _showAll,
                      child: const Text('Clear filters'),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Grid of cars
            Expanded(
              child: availableCars.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_off, size: 48, color: Color(0xFF9AA5B1)),
                          SizedBox(height: 12),
                          Text(
                            'No vehicles found',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF6C757D),
                            ),
                          ),
                          Text(
                            'Try adjusting your search or filters.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6C757D),
                            ),
                          ),
                        ],
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: AppTheme.responsiveCrossAxisCount(
                          MediaQuery.of(context).size.width,
                        ),
                        childAspectRatio: AppTheme.responsiveChildAspectRatio(
                          MediaQuery.of(context).size.width,
                        ),
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: availableCars.length,
                      itemBuilder: (context, index) {
                        final car = availableCars[index];
                        return CarCard(
                          car: car,
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              CarDetailsScreen.routeName,
                              arguments: car,
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
