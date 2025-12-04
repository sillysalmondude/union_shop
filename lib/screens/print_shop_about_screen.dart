import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/app_footer.dart';

class PrintShopAboutScreen extends StatelessWidget {
  const PrintShopAboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/print_shack_background.png',
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'Make It Yours at The Union Print Shack',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        'Want to add a personal touch? We\'ve got you covered with heat-pressed customisation on all our clothing. Swing by the shop - our team\'s always happy to help you pick the right gear and answer any questions.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Uni Gear or Your Gear - We\'ll Personalise It',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        'Whether you\'re repping your university or putting your own spin on a hoodie you already own, we\'ve got you covered. We can personalise official uni-branded clothing and your own items - just bring them in and let\'s get creative!',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Simple Pricing, No Surprises',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        'Customising your gear won\'t break the bank - just £3 for one line of text or a small chest logo, and £5 for two lines or a large back logo. Turnaround time is up to three working days, and we\'ll let you know as soon as it\'s ready to collect.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Personalisation Terms & Conditions',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        'We will print your clothing exactly as you have provided it to us, whether online or in person. We are not responsible for any spelling errors. Please ensure your chosen text is clearly displayed in either capitals or lowercase. Refunds are not provided for any personalised items.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Ready to Make It Yours?',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        'Pop in or get in touch today - let\'s create something uniquely you with our personalisation service - The Union Print Shack!',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}
