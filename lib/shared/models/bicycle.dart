class Bicycle {
  final int id;
  final String bicycleDescription;
  final String bicycleName;
  final int bicyclePrice;
  final String bicycleSize;
  final String bicycleModel;
  final String imageData;
  final double temperature;
  final double velocity;

  Bicycle({
    required this.id,
    required this.bicycleName,
    required this.bicycleDescription,
    required this.bicyclePrice,
    required this.bicycleSize,
    required this.bicycleModel,
    required this.imageData,
    required this.temperature,
    required this.velocity
  });

  factory Bicycle.fromJson(Map<String, dynamic> json) => Bicycle(
        id: json["id"],
        bicycleName: json["bicycleName"],
        bicycleDescription: json["bicycleDescription"],
        bicyclePrice: json["bicyclePrice"],
        bicycleSize: json["bicycleSize"],
        bicycleModel: json["bicycleModel"],
        imageData: json["imageData"],
        temperature: json["temperature"],
        velocity: json["velocity"]
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bicycleName": bicycleName,
        "bicycleDescription": bicycleDescription,
        "bicyclePrice": bicyclePrice,
        "bicycleSize": bicycleSize,
        "bicycleModel": bicycleModel,
        "imageData": imageData,
        "temperature": temperature,
        "velocity": velocity
      };
}
