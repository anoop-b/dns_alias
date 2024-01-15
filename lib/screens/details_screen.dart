import 'package:dns_alias/models/cloudflare.dart';
import 'package:dns_alias/models/txt_response.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Answer txtRecord;

  const DetailsScreen({super.key, required this.txtRecord});


  @override
  Widget build(BuildContext context) {
  TxtResponse parsedData = TxtResponse.fromTxtString(txtRecord.data);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Showing details for: ${txtRecord.name}",
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              shadowColor: Colors.transparent,
              child: ListTile(
                title: const Text("Raw Reponse:"),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Response: ${txtRecord.data}"),
                      Text('Type: ${txtRecord.type}'),
                      Text('TTL: ${txtRecord.ttl.toString()}'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Text(
            "Payment details for: ${txtRecord.name}",
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                decoration: TextDecoration.underline),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              // shadowColor: Colors.transparent,
              child: ListTile(
                title: Text('Benificary Name ${parsedData.pb}'),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text('Version: ${parsedData.version}'),
                      Text('Alias: ${parsedData.pa}'),
                      Text('URL: ${parsedData.url}'),
                      Text('Metadata: ${parsedData.md}'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
