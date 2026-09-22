import 'package:flutter/material.dart';

import '../models/campus_location.dart';
import 'success_page.dart';

class RoutePage extends StatelessWidget {
  const RoutePage({
    super.key,
    required this.location,
  });

  final CampusLocation location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Petunjuk Rute',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rute Menuju ${location.name}',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: ListView.builder(
                itemCount: location.routeInstructions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text(
                      location.routeInstructions[index],
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuccessPage(
                        location: location,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Saya Sudah Sampai'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}