import 'dart:convert';
import 'dart:io';

import 'package:lead_your_way/shared/models/bicycle.dart';
import 'package:lead_your_way/renting/utils/result.dart';
import 'package:http/http.dart' as http;

class BicycleService {
  final String _baseUrl = 'http://localhost:8080/api/leadyourway/v1/bicycles';

  Future<Result> getAllBicycles() async {
    http.Response response = await http.get(Uri.parse(_baseUrl));
    if(response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      final List maps = jsonResponse[{}];
      final data = maps.map((map) => Bicycle.fromJson(map)).toList();
      return Result(success: true, data: data, message: 'Success');
    }
    return const Result(success: false, data: null, message: 'An error has occurred');
  }
}