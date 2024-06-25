import 'dart:convert';
import 'dart:io';

import 'package:lead_your_way/shared/models/bicycle.dart';
import 'package:lead_your_way/renting/utils/result.dart';
import 'package:http/http.dart' as http;

class BicycleService {
  final String _baseUrl = 'http://localhost:8080/api/leadyourway/v1/bicycles';

  Future<Result> getAllBicycles() async {
    try {
      print('Requesting URL: $_baseUrl');
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
          final List<Bicycle> data = jsonResponse.map((map) => Bicycle.fromJson(map)).toList();
          return Result(success: true, data: data, message: 'Success');
        }
      else {
        print('Request failed with status: ${response.statusCode}.');
        return Result(success: false, data: null, message: 'Failed to load bicycles with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error caught: $e');
      return Result(success: false, data: null, message: 'An error occurred: $e');
    }
  }
}