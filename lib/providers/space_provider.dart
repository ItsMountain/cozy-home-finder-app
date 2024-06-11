import 'dart:convert';
import 'package:bwa_cozy/models/space.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  Future<List<Space>> getRecommendedSpaces() async {
    final Uri url = Uri.parse('https://bwa-cozy-api.vercel.app/recommended-spaces');

    final result = await http.get(url);

    // print('SpaceProvider - Status Code: ${result.statusCode}');
    // print('SpaceProvider - Body: ${result.body}');

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Space> spaces =
          data.map<Space>((item) => Space.fromJson(item)).toList();
      return spaces;
    } else {
      return <Space>[];
    }
  }
}
