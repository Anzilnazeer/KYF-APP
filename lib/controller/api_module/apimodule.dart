import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kyf/model/details_model.dart';

class ApiModule {
  static Future<List<DetailsModel>> fetchDetails() async {
  try {
    const url = 'https://fruityvice.com/api/fruit/all';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final json = jsonDecode(response.body);
      return List<DetailsModel>.from(
          json.map((x) => DetailsModel.fromJson(x)));
    } else {
      return throw Exception('');
    }
  } catch (e) {
    throw Exception('Failed to connect server');
  }
}
}
