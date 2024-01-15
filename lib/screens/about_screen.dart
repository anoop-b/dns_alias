import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const AboutDialog(
            applicationLegalese: 'A Demo application which utilizes DNS TXT records to fetch for payment aliases',
          ),
    );
  }
}