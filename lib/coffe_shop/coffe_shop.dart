import 'package:flutter/material.dart';
import 'models/menu_item.dart';
import 'widgets/menu_card.dart';

class CoffeeShopScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;

  const CoffeeShopScreen({
    super.key,
    required this.onToggleTheme,
  });

  @override
  State<CoffeeShopScreen> createState() => _CoffeeShopScreenState();
}

class _CoffeeShopScreenState extends State<CoffeeShopScreen> {
  String selectedCategory = 'Semua';

  final List<String> categories = [
    'Semua',
    'Coffee',
    'Non-Coffee',
    'Bakery',
    'Makanan',
  ];

  List<MenuItem> get filteredItems {
    if (selectedCategory == 'Semua') {
      return menuItems;
    }

    return menuItems
        .where((item) => item.category == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Zecoffe',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Coffee & Eatery',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: widget.onToggleTheme,
            tooltip: 'Ganti tema',
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded,
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Judul katalog
              Text(
                'Menu Zecoffe',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),

              const SizedBox(height: 4),

              Text(
                'Pilih minuman dan bakery favoritmu',
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const SizedBox(height: 16),

              // Filter kategori menggunakan Wrap + ChoiceChip
              Text(
                'Kategori',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),

              const SizedBox(height: 8),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: categories.map((category) {
                  return ChoiceChip(
                    label: Text(category),
                    selected: selectedCategory == category,
                    onSelected: (selected) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 16),

              // Jumlah menu
              Text(
                '${filteredItems.length} menu tersedia',
                style: Theme.of(context).textTheme.labelLarge,
              ),

              const SizedBox(height: 8),

              // Area katalog responsif
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Smartphone: 1 kolom
                    if (constraints.maxWidth < 600) {
                      return ListView.builder(
                        itemCount: filteredItems.length,
                        itemBuilder: (context, index) {
                          final item = filteredItems[index];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: MenuCard(
                              item: item,
                              onTap: () {
                                _showMenuDetail(item);
                              },
                            ),
                          );
                        },
                      );
                    }

                    // Tablet / layar lebar: 2 kolom
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 2.1,
                      ),
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        final item = filteredItems[index];

                        return MenuCard(
                          item: item,
                          onTap: () {
                            _showMenuDetail(item);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMenuDetail(MenuItem item) {
    String selectedSugar = 'Normal';
    String selectedIce = 'Normal';
    String selectedTopping = 'Tanpa Topping';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                20,
                8,
                20,
                MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header detail
                    Row(
                      children: [
                        Text(
                          item.icon,
                          style: const TextStyle(fontSize: 48),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Rp ${item.price}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Text(
                      'Kustomisasi Pesanan',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),

                    const SizedBox(height: 16),

                    // Pilihan gula
                    Text(
                      'Gula',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),

                    const SizedBox(height: 8),

                    Wrap(
                      spacing: 8,
                      children: [
                        _buildOptionChip(
                          label: 'Tanpa Gula',
                          selected: selectedSugar == 'Tanpa Gula',
                          onSelected: () {
                            setModalState(() {
                              selectedSugar = 'Tanpa Gula';
                            });
                          },
                        ),
                        _buildOptionChip(
                          label: 'Sedikit',
                          selected: selectedSugar == 'Sedikit',
                          onSelected: () {
                            setModalState(() {
                              selectedSugar = 'Sedikit';
                            });
                          },
                        ),
                        _buildOptionChip(
                          label: 'Normal',
                          selected: selectedSugar == 'Normal',
                          onSelected: () {
                            setModalState(() {
                              selectedSugar = 'Normal';
                            });
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Pilihan es
                    Text(
                      'Es',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),

                    const SizedBox(height: 8),

                    Wrap(
                      spacing: 8,
                      children: [
                        _buildOptionChip(
                          label: 'Tanpa Es',
                          selected: selectedIce == 'Tanpa Es',
                          onSelected: () {
                            setModalState(() {
                              selectedIce = 'Tanpa Es';
                            });
                          },
                        ),
                        _buildOptionChip(
                          label: 'Sedikit',
                          selected: selectedIce == 'Sedikit',
                          onSelected: () {
                            setModalState(() {
                              selectedIce = 'Sedikit';
                            });
                          },
                        ),
                        _buildOptionChip(
                          label: 'Normal',
                          selected: selectedIce == 'Normal',
                          onSelected: () {
                            setModalState(() {
                              selectedIce = 'Normal';
                            });
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Pilihan topping
                    Text(
                      'Topping',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),

                    const SizedBox(height: 8),

                    Wrap(
                      spacing: 8,
                      children: [
                        _buildOptionChip(
                          label: 'Tanpa Topping',
                          selected:
                              selectedTopping == 'Tanpa Topping',
                          onSelected: () {
                            setModalState(() {
                              selectedTopping = 'Tanpa Topping';
                            });
                          },
                        ),
                        _buildOptionChip(
                          label: 'Cheese',
                          selected: selectedTopping == 'Cheese',
                          onSelected: () {
                            setModalState(() {
                              selectedTopping = 'Cheese';
                            });
                          },
                        ),
                        _buildOptionChip(
                          label: 'Cream',
                          selected: selectedTopping == 'Cream',
                          onSelected: () {
                            setModalState(() {
                              selectedTopping = 'Cream';
                            });
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Tombol konfirmasi
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: () {
                          Navigator.pop(context);

                          ScaffoldMessenger.of(this.context)
                              .showSnackBar(
                            SnackBar(
                              content: Text(
                                '${item.name} berhasil dipilih '
                                '($selectedSugar, $selectedIce, '
                                '$selectedTopping)',
                              ),
                              behavior:
                                  SnackBarBehavior.floating,
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.shopping_cart_rounded,
                        ),
                        label: const Text(
                          'Konfirmasi Pesanan',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildOptionChip({
    required String label,
    required bool selected,
    required VoidCallback onSelected,
  }) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) {
        onSelected();
      },
    );
  }
}