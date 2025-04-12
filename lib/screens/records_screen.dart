import 'package:cached_network_image/cached_network_image.dart';
import 'package:dns_payments/providers/cloudflare_provider.dart';
import 'package:dns_payments/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecordsScreen extends ConsumerWidget {
  final String domain;

  const RecordsScreen({super.key, required this.domain});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final txtRecordsAsyncValue = ref.watch(cfProvider(domain));
    return Scaffold(
      appBar: AppBar(
        title: Text('TXT Records for $domain'),
      ),
      body: Consumer(
        builder: (context, watch, child) {
          return txtRecordsAsyncValue.when(
            data: (txtRecords) {
              // Render the list of TXT records
              return ListView.builder(
                itemCount: txtRecords.length,
                itemBuilder: (context, index) {
                  final record = txtRecords[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CachedNetworkImage(
                          imageUrl:
                              "https://www.google.com/s2/favicons?domain=${record.name}",
                          placeholder: (context, url) =>
                              const Icon(Icons.payment),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.payment),
                        ),
                        title: Text(
                          'Payment Record ${index + 1}: ${record.name}',
                        ),
                        // subtitle: Text(record.data),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsScreen(txtRecord: record),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            },
            loading: () {
              // Render a loading indicator
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            error: (error, stackTrace) {
              // Render an error state
              return Center(
                child: Text("Error: $error"),
              );
            },
          );
        },
      ),
    );
  }
}
