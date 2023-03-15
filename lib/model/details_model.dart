import 'nutrition_model.dart';

class DetailsModel {
  DetailsModel({
    required this.genus,
    required this.name,
    required this.id,
    required this.family,
    required this.order,
    required this.nutritions,
  });

  String genus;
  String name;
  int id;
  String family;
  String order;
  Nutritions nutritions;

  factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
        genus: json["genus"],
        name: json["name"],
        id: json["id"],
        family: json["family"],
        order: json["order"],
        nutritions: Nutritions.fromJson(json["nutritions"]),
      );

  Map<String, dynamic> toJson() => {
        "genus": genus,
        "name": name,
        "id": id,
        "family": family,
        "order": order,
        "nutritions": nutritions.toJson(),
      };
}
