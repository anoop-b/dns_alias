import 'package:dns_payments/screens/about_screen.dart';
import 'package:dns_payments/screens/records_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController domainController = TextEditingController();

  @override
  void dispose() {
    domainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          actions: [
            PopupMenuButton(
              elevation: 10,
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(
                  value: 1,
                  child: Text("About"),
                ),
              ],
              onSelected: (value) {
                                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const AboutScreen(),
                    ),
                  );
              },
            ),
          ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Please enter domain:',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: domainController,
                keyboardType: TextInputType.url,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'example.com',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FilledButton.tonal(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RecordsScreen(domain: domainController.text),
                    ),
                  );
                },
                child: const Text("Fetch Records"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
