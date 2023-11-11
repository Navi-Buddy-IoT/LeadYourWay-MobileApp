import 'package:lead_your_way/shared/models/bicycle.dart';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String birthDate;
  final double latitude;
  final double longitude;
  final String imageData;
  final List<Bicycle> bicycles;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.birthDate,
    required this.latitude,
    required this.longitude,
    required this.imageData,
    required this.bicycles,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      birthDate: json['birthDate'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      imageData: json['imageData'],
      bicycles: (json['bicycles'] as List<dynamic>)
          .map((bike) => Bicycle.fromJson(bike))
          .toList(),
    );
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      phone: map['phone'],
      birthDate: map['birthDate'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      imageData: map['imageData'],
      bicycles: (map['bicycles'] as List<dynamic>)
          .map((bike) => Bicycle.fromMap(bike))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'birthDate': birthDate,
      'latitude': latitude,
      'longitude': longitude,
      'imageData': imageData,
      'bicycles': bicycles.map((bike) => bike.toMap()).toList(),
    };
  }
}
