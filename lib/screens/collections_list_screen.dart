import 'package:flutter/material.dart';
import '../widgets/common/app_header.dart';
import '../widgets/common/app_footer.dart';
import '../models/collection.dart';
import '../utils/collection_loader.dart';

class CollectionsListScreen extends StatelessWidget {
  const CollectionsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 40),
              child: Column(
                children: [
                  const Text(
                    'Collections',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 40),
                  FutureBuilder<List<Collection>>(
                    future: loadCollections(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError || !snapshot.hasData) {
                        return const Text('Unable to load collections');
                      }

                      final collections = snapshot.data!;

                      if (collections.isEmpty) {
                        return const Text('No collections found');
                      }

                      return GridView.count(
                        shrinkWrap: true,
                        crossAxisCount:
                            MediaQuery.of(context).size.width > 768 ? 2 : 1,
                        crossAxisSpacing: 24,
                        mainAxisSpacing: 24,
                        childAspectRatio: 2,
                        children: collections.map((collection) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/collection/${collection.id}',
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/print_shack_background.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withValues(alpha: 0.5),
                                ),
                                child: Center(
                                  child: Text(
                                    collection.name,
                                    style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}
