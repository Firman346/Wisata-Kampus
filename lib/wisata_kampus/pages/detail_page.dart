import 'package:flutter/material.dart';

import '../models/campus_location.dart';
import 'route_page.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.location,
  });

  final CampusLocation location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text(
          'Detail Lokasi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar/ilustrasi lokasi
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                _getIcon(location.icon),
                size: 100,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            const SizedBox(height: 24),

            // Nama lokasi
            Text(
              location.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 8),

            // Area lokasi
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 6),
                Text(
                  location.area,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Judul deskripsi
            Text(
              'Tentang Lokasi',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 8),

            Text(
              location.description,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 30),

            // Tombol Lihat Rute
            SizedBox(
              width: double.infinity,
              height: 50,
              child: FilledButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RoutePage(
                        location: location,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.directions),
                label: const Text(
                  'Lihat Rute',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Tombol kembali
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'park':
        return Icons.park;
      case 'library':
        return Icons.account_balance;
      case 'laboratory':
        return Icons.science;
      default:
        return Icons.place;
    }
  }
}