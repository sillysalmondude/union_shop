import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String id;
  final String title;
  final String price;
  final String imageAsset;
  final String? salePrice;
  final bool isOnSale;

  const ProductCard({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.imageAsset,
    this.salePrice,
    this.isOnSale = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product/$id',
        );
      },
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Image.asset(
            imageAsset,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
          textAlign: TextAlign.left,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              price,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
                decoration: isOnSale ? TextDecoration.lineThrough : null,
              ),
            ),
            if (isOnSale) ...[
              const SizedBox(width: 8),
              Text(
                salePrice!,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ]),
    );
  }
}
