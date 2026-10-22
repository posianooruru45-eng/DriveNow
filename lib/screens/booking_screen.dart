import 'package:flutter/material.dart';

import '../data/car_data.dart';
import '../models/car.dart';
import '../theme/app_theme.dart';
import '../utils/formatters.dart';
import '../widgets/primary_button.dart';

/// Booking screen � simulated rental booking for a [Car].
///
/// The car is received automatically via route [arguments]. The customer
/// enters their details, rental dates, pickup location, and optional
/// instructions. Submitting shows a confirmation dialog.
class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key, required this.car});

  final Car car;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _pickupLocationController = TextEditingController();
  final _instructionsController = TextEditingController();

  DateTime? _pickupDate;
  DateTime? _returnDate;
  int _days = 1;

  @override
  void initState() {
    super.initState();
    _nameController.text = currentUser.name;
    _phoneController.text = currentUser.phone;
    _pickupLocationController.text = 'Kampala, Uganda';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _pickupLocationController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(BuildContext context, bool isPickup) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 90)),
    );
    if (picked == null) return;
    setState(() {
      if (isPickup) {
        _pickupDate = picked;
        if (_returnDate != null && _returnDate!.isBefore(picked)) {
          _returnDate = null;
        }
        _recomputeDays();
      } else {
        _returnDate = picked;
        _recomputeDays();
      }
    });
  }

  void _recomputeDays() {
    if (_pickupDate != null && _returnDate != null &&
        _returnDate!.isAfter(_pickupDate!)) {
      _days = _returnDate!.difference(_pickupDate!).inDays;
      if (_days < 1) _days = 1;
    } else {
      _days = 1;
    }
  }

  int get _total => widget.car.totalPrice(_days);

  void _confirmBooking() {
    if (!_formKey.currentState!.validate()) return;
    if (_pickupDate == null || _returnDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select both pickup and return dates.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Booking Confirmed (Simulated)'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Car: ${widget.car.fullName}'),
              Text('Category: ${widget.car.category}'),
              Text('Customer: ${_nameController.text}'),
              Text('Phone: ${_phoneController.text}'),
              Text('Pickup location: ${_pickupLocationController.text}'),
              Text('Pickup: ${Formatters.formatDate(_pickupDate!)}'),
              Text('Return: ${Formatters.formatDate(_returnDate!)}'),
              Text('Duration: $_days day${_days > 1 ? 's' : ''}'),
              if (_instructionsController.text.trim().isNotEmpty)
                Text('Instructions: ${_instructionsController.text}'),
              const SizedBox(height: 8),
              Text(
                'Estimated total: ${Formatters.formatPrice(_total)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'This is a simulated booking � no real payment was processed.',
                style: TextStyle(fontSize: 12, color: Color(0xFF6C757D)),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Your Car'),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Car summary card
                Card(
                  child: ListTile(
                    leading: widget.car.image.isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              widget.car.image,
                              height: 56,
                              width: 56,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => const Icon(
                                Icons.directions_car,
                                size: 28,
                                color: Color(0xFF9AA5B1),
                              ),
                            ),
                          )
                        : const Icon(
                            Icons.directions_car,
                            size: 28,
                            color: Color(0xFF9AA5B1),
                          ),
                    title: Text(
                      widget.car.fullName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.car.displayPrice),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Your Details',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2A44),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Full name',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone number',
                    prefixIcon: Icon(Icons.phone_outlined),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Pickup Location',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2A44),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _pickupLocationController,
                  decoration: const InputDecoration(
                    labelText: 'Where would you like to pick up the car?',
                    prefixIcon: Icon(Icons.location_on_outlined),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a pickup location';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Rental Dates',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2A44),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _DateField(
                        label: 'Pickup',
                        date: _pickupDate,
                        onTap: () => _pickDate(context, true),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _DateField(
                        label: 'Return',
                        date: _returnDate,
                        onTap: () => _pickDate(context, false),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Special Instructions (optional)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2A44),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _instructionsController,
                  decoration: const InputDecoration(
                    hintText: 'e.g. Please leave the car at the airport terminal',
                    prefixIcon: Icon(Icons.note_outlined),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppTheme.primary.withOpacity(0.2),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Estimated total'),
                      Text(
                        Formatters.formatPrice(_total),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                PrimaryButton(
                  onPressed: widget.car.available ? _confirmBooking : null,
                  child: const Text('Confirm Booking'),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Booking is simulated � no real payment or authentication.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6C757D),
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DateField extends StatelessWidget {
  const _DateField({
    required this.label,
    required this.date,
    required this.onTap,
  });

  final String label;
  final DateTime? date;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: const Icon(Icons.calendar_today_outlined),
        suffixIcon: const Icon(Icons.arrow_drop_down),
      ),
      controller: TextEditingController(
        text: date == null ? '' : Formatters.formatDate(date!),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select $label date';
        }
        return null;
      },
    );
  }
}
