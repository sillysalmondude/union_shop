import 'package:flutter/material.dart';
import '../widgets/common/app_header.dart';
import '../widgets/common/app_footer.dart';

class PrintShopScreen extends StatefulWidget {
  const PrintShopScreen({super.key});

  @override
  State<PrintShopScreen> createState() => _PrintShopScreenState();
}

class _PrintShopScreenState extends State<PrintShopScreen> {
  int numberOfLines = 1;
  double fontSize = 24.0;
  String line1 = '';
  String line2 = '';
  String line3 = '';

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
                        child: Container(
                          height: 400,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: Colors.grey[100],
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (line1.isNotEmpty)
                                  Text(
                                    line1,
                                    style: TextStyle(fontSize: fontSize),
                                  ),
                                if (line2.isNotEmpty)
                                  Text(
                                    line2,
                                    style: TextStyle(fontSize: fontSize),
                                  ),
                                if (line3.isNotEmpty)
                                  Text(
                                    line3,
                                    style: TextStyle(fontSize: fontSize),
                                  ),
                                if (line1.isEmpty &&
                                    line2.isEmpty &&
                                    line3.isEmpty)
                                  const Text(
                                    'Preview',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                              ],
                            ),
                          ),
                        ),
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
                              '£3 for one line of text! £5 for two!\n\nOne line of text is 10 characters.\n\nPlease ensure all spellings are correct before submitting your purchase as we will print your item with the exact wording you provide. We will not be responsible for any incorrect spellings printed onto your garment. Personalised items do not qualify for refunds.',
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
                            const SizedBox(height: 40),
                            const Text(
                              'Number of lines:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            DropdownButton<int>(
                              value: numberOfLines,
                              items: const [
                                DropdownMenuItem(
                                    value: 1, child: Text('1 line')),
                                DropdownMenuItem(
                                    value: 2, child: Text('2 lines')),
                                DropdownMenuItem(
                                    value: 3, child: Text('3 lines')),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  numberOfLines = value!;
                                });
                              },
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Font size:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Slider(
                              value: fontSize,
                              min: 12,
                              max: 48,
                              divisions: 36,
                              label: fontSize.round().toString(),
                              onChanged: (value) {
                                setState(() {
                                  fontSize = value;
                                });
                              },
                            ),
                            const SizedBox(height: 20),
                            if (numberOfLines >= 1)
                              TextField(
                                maxLength: 10,
                                decoration: const InputDecoration(
                                  labelText: 'Line 1',
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    line1 = value;
                                  });
                                },
                              ),
                            const SizedBox(height: 10),
                            if (numberOfLines >= 2)
                              TextField(
                                maxLength: 10,
                                decoration: const InputDecoration(
                                  labelText: 'Line 2',
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    line2 = value;
                                  });
                                },
                              ),
                            const SizedBox(height: 10),
                            if (numberOfLines >= 3)
                              TextField(
                                maxLength: 10,
                                decoration: const InputDecoration(
                                  labelText: 'Line 3',
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    line3 = value;
                                  });
                                },
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
