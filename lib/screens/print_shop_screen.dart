import 'package:flutter/material.dart';
import '../widgets/common/app_header.dart';
import '../widgets/common/app_footer.dart';

class PrintShopScreen extends StatelessWidget {
  const PrintShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  const Text(
                    'Print Shop',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Wrap(
                    spacing: 40,
                    runSpacing: 20,
                    children: [
                      ConstrainedBox(
                        constraints:
                            const BoxConstraints(minWidth: 300, maxWidth: 600),
                        child: Image.asset('assets/hoodies_sweatshirts.jpg'),
                      ),
                      ConstrainedBox(
                        constraints:
                            const BoxConstraints(minWidth: 300, maxWidth: 600),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Personalisation',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              '£3 for one line of text! £5 for two!',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 30),
                            const Text(
                              '£7.50',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4d2963),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
