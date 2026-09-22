import 'package:flutter/material.dart';

import '../models/campus_location.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({
    super.key,
    required this.location,
  });

  final CampusLocation location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                size: 100,
                color: Theme.of(context).colorScheme.primary,
              ),

              const SizedBox(height: 24),

              Text(
                'Anda Sudah Sampai!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),

              const SizedBox(height: 12),

              Text(
                'Selamat! Kamu telah sampai di ${location.name}.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.home_outlined),
                  label: const Text('Kembali ke Beranda'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}