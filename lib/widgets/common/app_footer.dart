import 'package:flutter/material.dart';
import '../../utils/validation.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  void handleSubscribe(BuildContext context, String email) {
    if (isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Thank you for subscribing!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid email address'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF5F5F5),
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Wrap(
            spacing: 40,
            runSpacing: 40,
            children: [
              SizedBox(
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Opening Hours',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    Text('Monday - Friday'),
                    Text('10am - 4pm'),
                    SizedBox(height: 8),
                    Text('Purchase online 24/7',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Help and Information',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerLeft),
                      child: Text('Search'),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerLeft),
                      child: Text('Terms & Conditions'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 250,
                child: Builder(
                  builder: (context) {
                    final emailController = TextEditingController();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Latest Offers',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(height: 12),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Email address',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(12),
                          ),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            handleSubscribe(context, emailController.text);
                          },
                          child: Text('Subscribe'),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
