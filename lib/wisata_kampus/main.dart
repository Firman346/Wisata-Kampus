import 'package:flutter/material.dart';

import 'models/campus_location.dart';
import 'pages/detail_page.dart';

void main() {
  runApp(const WisataKampusApp());
}

class WisataKampusApp extends StatelessWidget {
  const WisataKampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wisata Kampus',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final locations = [
      const CampusLocation(
        name: 'Taman Kampus',
        area: 'Area Utara',
        description:
            'Taman yang nyaman untuk bersantai, menikmati suasana kampus, dan beristirahat.',
        icon: 'park',
        routeInstructions: [
          'Dari gerbang utama, lurus sekitar 100 m.',
          'Belok kanan di Gedung A.',
          'Taman Kampus ada di sebelah kiri.',
        ],
      ),
      const CampusLocation(
        name: 'Perpustakaan',
        area: 'Area Tengah',
        description:
            'Tempat membaca, mencari referensi, dan belajar dengan suasana yang nyaman.',
        icon: 'library',
        routeInstructions: [
          'Dari gerbang utama, lurus sekitar 150 m.',
          'Belok kiri setelah Gedung B.',
          'Perpustakaan berada di sebelah kanan.',
        ],
      ),
      const CampusLocation(
        name: 'Laboratorium',
        area: 'Area Selatan',
        description:
            'Fasilitas praktikum mahasiswa untuk mendukung kegiatan pembelajaran.',
        icon: 'laboratory',
        routeInstructions: [
          'Dari gerbang utama, lurus sekitar 200 m.',
          'Lewati Gedung C.',
          'Laboratorium berada di sebelah kiri.',
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text(
          'Wisata Kampus',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Ilustrasi kampus
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 25,
                  bottom: 25,
                  child: Icon(
                    Icons.park,
                    size: 65,
                    color: Colors.green.shade600,
                  ),
                ),
                Positioned(
                  right: 25,
                  bottom: 25,
                  child: Icon(
                    Icons.park,
                    size: 65,
                    color: Colors.green.shade600,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_balance,
                      size: 85,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Kampus Kita',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Sambutan
          Text(
            'Selamat Datang!',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Temukan tempat menarik di dalam kampus kami.',
            style: TextStyle(
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 24),

          // Daftar lokasi
          ...locations.map(
            (location) => _LocationCard(
              location: location,
            ),
          ),
        ],
      ),
    );
  }
}

class _LocationCard extends StatelessWidget {
  const _LocationCard({
    required this.location,
  });

  final CampusLocation location;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 1,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 6,
        ),
        leading: CircleAvatar(
          backgroundColor:
              Theme.of(context).colorScheme.primaryContainer,
          child: Icon(
            _getIcon(location.icon),
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        title: Text(
          location.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(location.area),
        trailing: const Icon(
          Icons.chevron_right,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                location: location,
              ),
            ),
          );
        },
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