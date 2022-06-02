import 'dart:convert';

PlaceModel placeModelFromJson(String str) =>
    PlaceModel.fromJson(json.decode(str));

String placeModelToJson(PlaceModel data) => json.encode(data.toJson());

class PlaceModel {
  PlaceModel({
    required this.predictions,
    required this.status,
  });

  List<Prediction> predictions;
  String status;

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
    predictions: List<Prediction>.from(
      json["predictions"].map(
            (x) => Prediction.fromJson(x),
      ),
    ),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "predictions": List<dynamic>.from(
      predictions.map(
            (x) => x.toJson(),
      ),
    ),
    "status": status,
  };
}

class Prediction {
  Prediction({
    this.description
  });

  String? description;

  factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "description": description,
  };
}