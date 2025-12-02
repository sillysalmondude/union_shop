import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageAsset;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image.asset(
            imageAsset,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(Icons.image_not_supported, color: Colors.grey),
                ),
              );
            },
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
        Text(
          price,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
