/// Data model for a rental car.
///
/// All data is static/hard-coded for this capstone project (no database,
/// no Firebase, no external API).
class Car {
  const Car({
    required this.id,
    required this.make,
    required this.model,
    required this.year,
    required this.category,
    required this.image,
    required this.pricePerDay,
    required this.transmission,
    required this.fuelType,
    required this.seats,
    required this.features,
    required this.description,
    this.available = true,
  });

  final String id;
  final String make;
  final String model;
  final int year;
  final String category; // Economy, Sedan, SUV, Family, Premium
  final String image;
  final int pricePerDay; // in UGX
  final String transmission;
  final String fuelType;
  final int seats;
  final List<String> features;
  final String description;
  final bool available;

  /// Human readable display name, e.g. "2024 Toyota Premio"
  String get fullName => '$year $make $model';

  /// Price formatted for display, e.g. "UGX 120,000 / day"
  String get displayPrice => 'UGX ${pricePerDay.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]},',
      )} / day';

  /// Total price for a number of days.
  int totalPrice(int days) => pricePerDay * days;

  Car copyWith({
    String? id,
    String? make,
    String? model,
    int? year,
    String? category,
    String? image,
    int? pricePerDay,
    String? transmission,
    String? fuelType,
    int? seats,
    List<String>? features,
    String? description,
    bool? available,
  }) {
    return Car(
      id: id ?? this.id,
      make: make ?? this.make,
      model: model ?? this.model,
      year: year ?? this.year,
      category: category ?? this.category,
      image: image ?? this.image,
      pricePerDay: pricePerDay ?? this.pricePerDay,
      transmission: transmission ?? this.transmission,
      fuelType: fuelType ?? this.fuelType,
      seats: seats ?? this.seats,
      features: features ?? this.features,
      description: description ?? this.description,
      available: available ?? this.available,
    );
  }

  @override
  String toString() {
    return 'Car(id: $id, $fullName, $displayPrice)';
  }
}