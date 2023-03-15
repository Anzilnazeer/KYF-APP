class Nutritions {
    Nutritions({
        required this.carbohydrates,
        required this.protein,
        required this.fat,
        required this.calories,
        required this.sugar,
    });

    double carbohydrates;
    double protein;
    double fat;
    int calories;
    double sugar;



    factory Nutritions.fromJson(Map<String, dynamic> json) => Nutritions(
        carbohydrates: json["carbohydrates"]?.toDouble(),
        protein: json["protein"]?.toDouble(),
        fat: json["fat"]?.toDouble(),
        calories: json["calories"],
        sugar: json["sugar"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "carbohydrates": carbohydrates,
        "protein": protein,
        "fat": fat,
        "calories": calories,
        "sugar": sugar,
    };
}
