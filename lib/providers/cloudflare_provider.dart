import 'dart:convert';
import 'dart:io';
import 'package:dns_payments/models/cloudflare.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;


class Cloudflare {
  Future<List<Answer>> getTxtRecords(String domain) async {
    // Perform DNS query using Cloudflare DoH API
    final url = Uri(
      scheme: 'https',
      host: 'cloudflare-dns.com',
      path: '/dns-query',
      queryParameters: {
        'name': domain,
        'type': '16',
      },
    );
    final response = await http.get(
      url,
      headers: {
        HttpHeaders.acceptHeader: 'application/dns-json',
      },
    );

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      final DnsResponse jsonResponse = DnsResponse.fromJson(responseJson);
      return jsonResponse.answer;
    } else {
      throw 'Failed to get TXT records. Status code: ${response.statusCode}';
    }
  }
}

final cf = Provider<Cloudflare>((ref) => Cloudflare());
final cfProvider = FutureProvider.autoDispose
    .family<List<Answer>, String>((ref, domain) async {
  final client = ref.read(cf);
  return client.getTxtRecords(domain);
});
