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
      title: 'Informasi Wisata Kampus',
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
        area: 'Area Tengah',
        description:
            'Taman yang nyaman untuk bersantai, menikmati suasana kampus, dan beristirahat.',
        image: 'assets/images/taman.png',
        routeInstructions: [
          'Dari gerbang masuk, berjalan lurus sekitar 100 meter menuju bagian tengah kampus.',
          'Taman Kampus berada di area Jurusan Teknik, tepat di bagian tengah lingkungan kampus.',
          'Ikuti area tengah kampus hingga menemukan Taman Kampus.',
        ],
      ),
      const CampusLocation(
        name: 'Perpustakaan',
        area: 'Area Depan',
        description:
            'Tempat membaca, mencari referensi, dan belajar dengan suasana yang nyaman.',
        image: 'assets/images/perpustakaan.png',
        routeInstructions: [
          'Dari gerbang masuk, perpustakaan berada di bagian depan kampus.',
          'Perpustakaan terletak di samping mushola dan berada dekat dengan gerbang masuk.',
          'Naik menuju lantai 3 untuk menemukan ruang perpustakaan.',
        ],
      ),
      const CampusLocation(
        name: 'Laboratorium',
        area: 'Area Belakang',
        description:
            'Fasilitas praktikum mahasiswa untuk mendukung kegiatan pembelajaran.',
        image: 'assets/images/lab.png',
        routeInstructions: [
          'Dari gerbang masuk, berjalan menuju bagian belakang kampus.',
          'Ikuti jalan hingga menemukan Gedung A.',
          'Setelah menemukan Gedung A, belok kanan untuk menuju area laboratorium.',
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
          'Informasi Wisata Kampus',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Foto utama
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/home.png',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Selamat Datang!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'Temukan tempat menarik di dalam kampus kami.',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade700,
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Lokasi Kampus',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

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
      margin: const EdgeInsets.only(bottom: 14),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: InkWell(
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
        child: Row(
          children: [
            Image.asset(
              location.image,
              width: 110,
              height: 100,
              fit: BoxFit.cover,
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location.name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      location.area,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Lihat Detail',
                          style: TextStyle(
                            color: Colors.blue.shade700,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: Colors.blue.shade700,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}