import '../models/car.dart';

/// The currently logged-in (simulated) user profile.
///
/// No real authentication is used for this capstone project.
class AppUser {
  const AppUser({
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
  });

  final String name;
  final String email;
  final String phone;
  final String image;
}

/// Simulated current user.
final AppUser currentUser = const AppUser(
  name: 'Nabirye Topister',
  email: 'nabirye@example.com',
  phone: '+256 700 000 000',
  image: 'assets/images/avatar.png',
);

/// Static sample cars available for rental.
///
/// Every [image] path matches the vehicle model so there is no mismatch.
/// Add your actual image files to `assets/images/` using the exact filenames below.
final List<Car> sampleCars = const [
  // ============ SUVs ============
  Car(
    id: 's1',
    make: 'Toyota',
    model: 'Prado',
    year: 2022,
    category: 'SUV',
    image: 'assets/images/toyota_prado.png',
    pricePerDay: 250000,
    transmission: 'Manual',
    fuelType: 'Diesel',
    seats: 7,
    features: ['4WD', 'Air Conditioning', 'Roof Rails', 'Bluetooth'],
    description:
        'Rugged SUV built for upcountry trips and rough terrain. '
        'Spacious for families and groups.',
    available: true,
  ),
  Car(
    id: 's2',
    make: 'Toyota',
    model: 'RAV4',
    year: 2023,
    category: 'SUV',
    image: 'assets/images/toyota_rav4.png',
    pricePerDay: 150000,
    transmission: 'Automatic',
    fuelType: 'Petrol',
    seats: 5,
    features: ['Air Conditioning', 'Bluetooth', 'Reverse Camera', 'USB Charging'],
    description:
        'Compact SUV perfect for city driving and light upcountry trips. '
        'Fuel-efficient, easy to park, and comfortable for small families.',
    available: true,
  ),
  Car(
    id: 's3',
    make: 'Nissan',
    model: 'X-Trail',
    year: 2023,
    category: 'SUV',
    image: 'assets/images/nissan_xtrail.png',
    pricePerDay: 160000,
    transmission: 'Automatic',
    fuelType: 'Petrol',
    seats: 5,
    features: ['Air Conditioning', 'Reverse Camera', 'Bluetooth', 'USB Charging'],
    description:
        'Modern crossover with ample cargo space and a smooth ride '
        'for both city and highway use.',
    available: true,
  ),
  Car(
    id: 's4',
    make: 'Subaru',
    model: 'Forester',
    year: 2022,
    category: 'SUV',
    image: 'assets/images/subaru_forester.png',
    pricePerDay: 190000,
    transmission: 'Automatic',
    fuelType: 'Petrol',
    seats: 5,
    features: ['Air Conditioning', 'Reverse Camera', 'Bluetooth', 'Sunroof'],
    description:
        'Reliable all-weather SUV with excellent visibility and safety features.',
    available: true,
  ),
  Car(
    id: 's5',
    make: 'Mitsubishi',
    model: 'Pajero',
    year: 2019,
    category: 'SUV',
    image: 'assets/images/mitsubishi_pajero.png',
    pricePerDay: 220000,
    transmission: 'Manual',
    fuelType: 'Diesel',
    seats: 7,
    features: ['4WD', 'Air Conditioning', 'Roof Rails'],
    description:
        'Powerful off-roader with spacious seating for larger groups '
        'and adventure trips.',
    available: false,
  ),
  Car(
    id: 's6',
    make: 'Honda',
    model: 'CR-V',
    year: 2022,
    category: 'SUV',
    image: 'assets/images/honda_crv.png',
    pricePerDay: 170000,
    transmission: 'Automatic',
    fuelType: 'Petrol',
    seats: 5,
    features: ['Air Conditioning', 'Bluetooth', 'Reverse Camera', 'Sunroof'],
    description:
        'Spacious family SUV with ample cargo room and a smooth ride '
        'for both city and highway use.',
    available: true,
  ),

  // ============ Sedans ============
  Car(
    id: 'sd1',
    make: 'Toyota',
    model: 'Premio',
    year: 2020,
    category: 'Sedan',
    image: 'assets/images/toyota_premio.png',
    pricePerDay: 95000,
    transmission: 'Automatic',
    fuelType: 'Petrol',
    seats: 5,
    features: ['Air Conditioning', 'Bluetooth'],
    description:
        'Comfortable and fuel-efficient sedan ideal for city driving '
        'and short trips around town.',
    available: true,
  ),
  Car(
    id: 'sd2',
    make: 'Toyota',
    model: 'Corolla',
    year: 2022,
    category: 'Sedan',
    image: 'assets/images/toyota_corolla.png',
    pricePerDay: 90000,
    transmission: 'Automatic',
    fuelType: 'Petrol',
    seats: 5,
    features: ['Air Conditioning', 'Bluetooth', 'Reverse Camera'],
    description:
        'Reliable and economical sedan ideal for daily commuting.',
    available: true,
  ),
  Car(
    id: 'sd3',
    make: 'Toyota',
    model: 'Allion',
    year: 2019,
    category: 'Sedan',
    image: 'assets/images/toyota_allion.png',
    pricePerDay: 85000,
    transmission: 'Automatic',
    fuelType: 'Petrol',
    seats: 5,
    features: ['Air Conditioning', 'Bluetooth'],
    description:
        'Elegant sedan with smooth ride and good fuel economy.',
    available: true,
  ),
  Car(
    id: 'sd4',
    make: 'Honda',
    model: 'Accord',
    year: 2021,
    category: 'Sedan',
    image: 'assets/images/honda_accord.png',
    pricePerDay: 130000,
    transmission: 'Automatic',
    fuelType: 'Petrol',
    seats: 5,
    features: ['Air Conditioning', 'Bluetooth', 'Reverse Camera', 'Sunroof'],
    description:
        'Refined mid-size sedan with premium comfort.',
    available: true,
  ),
  Car(
    id: 'sd5',
    make: 'Mercedes-Benz',
    model: 'E-Class',
    year: 2022,
    category: 'Sedan',
    image: 'assets/images/mercedes_e_class.png',
    pricePerDay: 200000,
    transmission: 'Automatic',
    fuelType: 'Petrol',
    seats: 5,
    features: ['Air Conditioning', 'Bluetooth', 'Reverse Camera', 'Sunroof', 'Leather Seats'],
    description:
        'Luxury executive sedan with advanced safety and comfort.',
    available: true,
  ),
  Car(
    id: 'sd6',
    make: 'BMW',
    model: '5 Series',
    year: 2021,
    category: 'Sedan',
    image: 'assets/images/bmw_5_series.png',
    pricePerDay: 210000,
    transmission: 'Automatic',
    fuelType: 'Petrol',
    seats: 5,
    features: ['Air Conditioning', 'Bluetooth', 'Reverse Camera', 'Sunroof', 'Leather Seats'],
    description:
        'Sporty luxury sedan with powerful performance.',
    available: true,
  ),

  // ============ Hatchbacks ============
  Car(
    id: 'h1',
    make: 'Toyota',
    model: 'Vitz',
    year: 2018,
    category: 'Hatchback',
    image: 'assets/images/toyota_vitz.png',
    pricePerDay: 65000,
    transmission: 'Automatic',
    fuelType: 'Petrol',
    seats: 5,
    features: ['Air Conditioning', 'Bluetooth'],
    description:
        'Compact and economical hatchback perfect for solo travelers.',
    available: true,
  ),
  Car(
    id: 'h2',
    make: 'Honda',
    model: 'Fit',
    year: 2020,
    category: 'Hatchback',
    image: 'assets/images/honda_fit.png',
    pricePerDay: 75000,
    transmission: 'Automatic',
    fuelType: 'Petrol',
    seats: 5,
    features: ['Air Conditioning', 'Bluetooth'],
    description:
        'Compact and economical hatchback perfect for couples on a budget.',
    available: true,
  ),
  Car(
    id: 'h3',
    make: 'Toyota',
    model: 'Passo',
    year: 2019,
    category: 'Hatchback',
    image: 'assets/images/toyota_passo.png',
    pricePerDay: 60000,
    transmission: 'Automatic',
    fuelType: 'Petrol',
    seats: 4,
    features: ['Air Conditioning'],
    description:
        'Tiny and fuel-efficient city car for easy parking.',
    available: true,
  ),
  Car(
    id: 'h4',
    make: 'Nissan',
    model: 'Note',
    year: 2020,
    category: 'Hatchback',
    image: 'assets/images/nissan_note.png',
    pricePerDay: 70000,
    transmission: 'Automatic',
    fuelType: 'Petrol',
    seats: 5,
    features: ['Air Conditioning', 'Bluetooth'],
    description:
        'Practical hatchback with good interior space.',
    available: true,
  ),
  Car(
    id: 'h5',
    make: 'Volkswagen',
    model: 'Golf',
    year: 2019,
    category: 'Hatchback',
    image: 'assets/images/volkswagen_golf.png',
    pricePerDay: 80000,
    transmission: 'Manual',
    fuelType: 'Petrol',
    seats: 5,
    features: ['Air Conditioning', 'Bluetooth'],
    description:
        'Well-built European hatchback with solid handling.',
    available: true,
  ),

  // ============ Pickups ============
  Car(
    id: 'p1',
    make: 'Toyota',
    model: 'Hilux',
    year: 2022,
    category: 'Pickup',
    image: 'assets/images/toyota_hilux.png',
    pricePerDay: 180000,
    transmission: 'Manual',
    fuelType: 'Diesel',
    seats: 5,
    features: ['4WD', 'Air Conditioning', 'Bluetooth'],
    description:
        'Legendary pickup built for tough work and off-road use.',
    available: true,
  ),
  Car(
    id: 'p2',
    make: 'Isuzu',
    model: 'D-Max',
    year: 2021,
    category: 'Pickup',
    image: 'assets/images/isuzu_dmax.png',
    pricePerDay: 170000,
    transmission: 'Manual',
    fuelType: 'Diesel',
    seats: 5,
    features: ['4WD', 'Air Conditioning'],
    description:
        'Reliable pickup with strong towing capacity.',
    available: true,
  ),
  Car(
    id: 'p3',
    make: 'Mitsubishi',
    model: 'L200',
    year: 2020,
    category: 'Pickup',
    image: 'assets/images/mitsubishi_l200.png',
    pricePerDay: 160000,
    transmission: 'Manual',
    fuelType: 'Diesel',
    seats: 5,
    features: ['4WD', 'Air Conditioning'],
    description:
        'Capable pickup truck for work and adventure.',
    available: true,
  ),
  Car(
    id: 'p4',
    make: 'Ford',
    model: 'Ranger',
    year: 2022,
    category: 'Pickup',
    image: 'assets/images/ford_ranger.png',
    pricePerDay: 190000,
    transmission: 'Automatic',
    fuelType: 'Diesel',
    seats: 5,
    features: ['4WD', 'Air Conditioning', 'Bluetooth', 'Reverse Camera'],
    description:
        'Modern pickup with refined ride and technology.',
    available: true,
  ),
  Car(
    id: 'p5',
    make: 'Nissan',
    model: 'Navara',
    year: 2021,
    category: 'Pickup',
    image: 'assets/images/nissan_navara.png',
    pricePerDay: 175000,
    transmission: 'Manual',
    fuelType: 'Diesel',
    seats: 5,
    features: ['4WD', 'Air Conditioning'],
    description:
        'Comfortable pickup with good load capacity.',
    available: true,
  ),

  // ============ Family vans / MPVs ============
  Car(
    id: 'f1',
    make: 'Toyota',
    model: 'Noah',
    year: 2021,
    category: 'Family Van',
    image: 'assets/images/toyota_noah.png',
    pricePerDay: 140000,
    transmission: 'Automatic',
    fuelType: 'Petrol',
    seats: 7,
    features: ['Air Conditioning', 'Bluetooth', 'Sliding Doors'],
    description:
        'Spacious family van perfect for group travel.',
    available: true,
  ),
  Car(
    id: 'f2',
    make: 'Toyota',
    model: 'HiAce',
    year: 2020,
    category: 'Family Van',
    image: 'assets/images/toyota_hiace.png',
    pricePerDay: 160000,
    transmission: 'Manual',
    fuelType: 'Diesel',
    seats: 14,
    features: ['Air Conditioning', 'Bluetooth'],
    description:
        'Large people carrier for big groups and luggage.',
    available: true,
  ),
  Car(
    id: 'f3',
    make: 'Toyota',
    model: 'Sienta',
    year: 2022,
    category: 'Family Van',
    image: 'assets/images/toyota_sienta.png',
    pricePerDay: 130000,
    transmission: 'Automatic',
    fuelType: 'Petrol',
    seats: 7,
    features: ['Air Conditioning', 'Bluetooth', 'Sliding Doors'],
    description:
        'Compact family van with easy entry and exit.',
    available: true,
  ),
  Car(
    id: 'f4',
    make: 'Honda',
    model: 'Stepwgn',
    year: 2021,
    category: 'Family Van',
    image: 'assets/images/honda_stepwgn.png',
    pricePerDay: 150000,
    transmission: 'Automatic',
    fuelType: 'Petrol',
    seats: 7,
    features: ['Air Conditioning', 'Bluetooth', 'Sliding Doors'],
    description:
        'Versatile family van with flexible seating.',
    available: true,
  ),

  // ============ Luxury SUVs ============
  Car(
    id: 'l1',
    make: 'Toyota',
    model: 'Land Cruiser 300',
    year: 2023,
    category: 'Luxury SUV',
    image: 'assets/images/toyota_land_cruiser_300.png',
    pricePerDay: 350000,
    transmission: 'Automatic',
    fuelType: 'Diesel',
    seats: 7,
    features: ['4WD', 'Air Conditioning', 'Bluetooth', 'Reverse Camera', 'Leather Seats'],
    description:
        'Ultimate luxury off-road SUV with premium comfort.',
    available: true,
  ),
  Car(
    id: 'l2',
    make: 'Lexus',
    model: 'RX',
    year: 2022,
    category: 'Luxury SUV',
    image: 'assets/images/lexus_rx.png',
    pricePerDay: 280000,
    transmission: 'Automatic',
    fuelType: 'Petrol',
    seats: 5,
    features: ['Air Conditioning', 'Bluetooth', 'Reverse Camera', 'Leather Seats'],
    description:
        'Luxury crossover with refined ride and premium interior.',
    available: true,
  ),
  Car(
    id: 'l3',
    make: 'Land Rover',
    model: 'Range Rover Sport',
    year: 2022,
    category: 'Luxury SUV',
    image: 'assets/images/range_rover_sport.png',
    pricePerDay: 320000,
    transmission: 'Automatic',
    fuelType: 'Petrol',
    seats: 5,
    features: ['Air Conditioning', 'Bluetooth', 'Reverse Camera', 'Leather Seats'],
    description:
        'Premium luxury SUV with outstanding capability.',
    available: true,
  ),
  Car(
    id: 'l4',
    make: 'BMW',
    model: 'X5',
    year: 2022,
    category: 'Luxury SUV',
    image: 'assets/images/bmw_x5.png',
    pricePerDay: 300000,
    transmission: 'Automatic',
    fuelType: 'Petrol',
    seats: 5,
    features: ['Air Conditioning', 'Bluetooth', 'Reverse Camera', 'Leather Seats'],
    description:
        'Sporty luxury SUV with powerful performance.',
    available: true,
  ),
  Car(
    id: 'l5',
    make: 'Mercedes-Benz',
    model: 'GLE',
    year: 2022,
    category: 'Luxury SUV',
    image: 'assets/images/mercedes_gle.png',
    pricePerDay: 310000,
    transmission: 'Automatic',
    fuelType: 'Diesel',
    seats: 5,
    features: ['Air Conditioning', 'Bluetooth', 'Reverse Camera', 'Leather Seats'],
    description:
        'Elegant luxury SUV with advanced technology.',
    available: true,
  ),

  // ============ Other compact SUVs and cars ============
  Car(
    id: 'o1',
    make: 'Hyundai',
    model: 'Tucson',
    year: 2022,
    category: 'Compact SUV',
    image: 'assets/images/hyundai_tucson.png',
    pricePerDay: 165000,
    transmission: 'Automatic',
    fuelType: 'Petrol',
    seats: 5,
    features: ['Air Conditioning', 'Bluetooth', 'Reverse Camera'],
    description:
        'Stylish compact SUV with modern features.',
    available: true,
  ),
  Car(
    id: 'o2',
    make: 'Kia',
    model: 'Sportage',
    year: 2022,
    category: 'Compact SUV',
    image: 'assets/images/kia_sportage.png',
    pricePerDay: 160000,
    transmission: 'Automatic',
    fuelType: 'Petrol',
    seats: 5,
    features: ['Air Conditioning', 'Bluetooth', 'Reverse Camera'],
    description:
        'Well-equipped compact SUV for urban adventures.',
    available: true,
  ),
  Car(
    id: 'o3',
    make: 'Mazda',
    model: 'CX-5',
    year: 2022,
    category: 'Compact SUV',
    image: 'assets/images/mazda_cx5.png',
    pricePerDay: 170000,
    transmission: 'Automatic',
    fuelType: 'Petrol',
    seats: 5,
    features: ['Air Conditioning', 'Bluetooth', 'Reverse Camera'],
    description:
        'Premium compact SUV with engaging handling.',
    available: true,
  ),
  Car(
    id: 'o4',
    make: 'Suzuki',
    model: 'Swift',
    year: 2021,
    category: 'Compact',
    image: 'assets/images/suzuki_swift.png',
    pricePerDay: 70000,
    transmission: 'Manual',
    fuelType: 'Petrol',
    seats: 5,
    features: ['Air Conditioning'],
    description:
        'Nimble and fuel-efficient compact car.',
    available: true,
  ),
  Car(
    id: 'o5',
    make: 'Jeep',
    model: 'Wrangler',
    year: 2022,
    category: 'Compact SUV',
    image: 'assets/images/jeep_wrangler.png',
    pricePerDay: 240000,
    transmission: 'Manual',
    fuelType: 'Petrol',
    seats: 4,
    features: ['4WD', 'Air Conditioning', 'Removable Top'],
    description:
        'Iconic off-road vehicle for adventure seekers.',
    available: true,
  ),
];

/// Returns a [Car] by its [id], or null if not found.
Car? carById(String id) {
  try {
    return sampleCars.firstWhere((car) => car.id == id);
  } catch (_) {
    return null;
  }
}

/// All vehicle categories shown as filter chips on Home and Cars screens.
final List<String> vehicleCategories = const [
  'SUV',
  'Sedan',
  'Hatchback',
  'Pickup',
  'Family Van',
  'Luxury SUV',
  'Compact SUV',
  'Compact',
];

/// Returns cars filtered by [category], or all cars if category is null.
List<Car> carsByCategory(String? category) {
  if (category == null || category.isEmpty) {
    return List<Car>.from(sampleCars);
  }
  return sampleCars.where((car) => car.category == category).toList();
}

/// Returns cars whose make or model contains [query] (case-insensitive).
List<Car> searchCars(String query) {
  if (query.trim().isEmpty) {
    return List<Car>.from(sampleCars);
  }
  final q = query.toLowerCase();
  return sampleCars.where((car) {
    return car.make.toLowerCase().contains(q) ||
        car.model.toLowerCase().contains(q) ||
        car.category.toLowerCase().contains(q);
  }).toList();
}
