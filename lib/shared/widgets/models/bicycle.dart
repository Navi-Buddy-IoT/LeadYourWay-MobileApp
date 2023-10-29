class Bicycle {
  final int id;
  final String bicycleDescription;
  final String bicycleName;
  final int bicyclePrice;
  final String bicycleSize;
  final String bicycleModel;
  final String imageData;

  Bicycle({
    required this.id,
    required this.bicycleDescription,
    required this.bicycleName,
    required this.bicyclePrice,
    required this.bicycleSize,
    required this.bicycleModel,
    required this.imageData,
  });

  factory Bicycle.fromJson(Map<String, dynamic> json) => Bicycle(
        id: json["id"],
        bicycleDescription: json["bicycleDescription"],
        bicycleName: json["bicycleName"],
        bicyclePrice: json["bicyclePrice"],
        bicycleSize: json["bicycleSize"],
        bicycleModel: json["bicycleModel"],
        imageData: json["imageData"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bicycleDescription": bicycleDescription,
        "bicycleName": bicycleName,
        "bicyclePrice": bicyclePrice,
        "bicycleSize": bicycleSize,
        "bicycleModel": bicycleModel,
        "imageData": imageData,
      };
}
