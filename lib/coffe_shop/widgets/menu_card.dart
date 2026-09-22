import 'package:flutter/material.dart';
import '../models/menu_item.dart';

class MenuCard extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onTap;

  const MenuCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  String _formatPrice(int price) {
    return 'Rp ${price.toString().replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match.group(1)}.',
        )}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Ikon menu
                  Container(
                    width: 72,
                    height: 72,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primaryContainer,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      item.icon,
                      style: const TextStyle(fontSize: 36),
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Informasi menu
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          item.category,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary,
                              ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          item.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall,
                        ),

                        const SizedBox(height: 8),

                        Row(
                          children: [
                            Text(
                              _formatPrice(item.price),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.star_rounded,
                              size: 18,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              item.rating.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Badge promo di pojok kanan atas
            if (item.badgeText.isNotEmpty)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.error,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    item.badgeText,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onError,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}