import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import '../models/bike_model.dart';
import '../core/app_colors.dart';

class BookingScreen extends StatefulWidget {
  final BikeModel bike;
  const BookingScreen({super.key, required this.bike});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? _pickupDate;
  DateTime? _returnDate;

  int get _totalDays {
    if (_pickupDate != null && _returnDate != null) {
      final days = _returnDate!.difference(_pickupDate!).inDays + 1;
      return days > 0 ? days : 0;
    }
    return 0;
  }

  double get _totalPrice => _totalDays * widget.bike.pricePerDay;

  Future<void> _selectPickupDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) {
      setState(() {
        _pickupDate = date;
        if (_returnDate != null && _returnDate!.isBefore(_pickupDate!)) {
          _returnDate = null;
        }
      });
    }
  }

  Future<void> _selectReturnDate() async {
    final initial = _pickupDate ?? DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: initial,
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) {
      setState(() {
        _returnDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Dates')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Booking for ${widget.bike.title}', style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 20)),
              const SizedBox(height: 32),
              ListTile(
                title: const Text('Pickup Date'),
                subtitle: Text(_pickupDate == null ? 'Select a date' : DateFormat('MMM dd, yyyy').format(_pickupDate!)),
                trailing: const Icon(Icons.calendar_today),
                onTap: _selectPickupDate,
                tileColor: Theme.of(context).cardColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ).animate().fadeIn(duration: 300.ms),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Return Date'),
                subtitle: Text(_returnDate == null ? 'Select a date' : DateFormat('MMM dd, yyyy').format(_returnDate!)),
                trailing: const Icon(Icons.calendar_today),
                onTap: _selectReturnDate,
                tileColor: Theme.of(context).cardColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ).animate().fadeIn(delay: 100.ms, duration: 300.ms),
              const Spacer(),
              if (_totalDays > 0)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total Days:', style: TextStyle(fontSize: 16)),
                        Text('$_totalDays', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total Price:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(
                          '\$${_totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(color: AppColors.primary, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ).animate().fadeIn(duration: 400.ms),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: (_pickupDate != null && _returnDate != null)
                    ? () {
                        context.go('/booking-success');
                      }
                    : null,
                child: const Text('Confirm Booking'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
