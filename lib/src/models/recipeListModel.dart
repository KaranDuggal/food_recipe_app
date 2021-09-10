// To parse this JSON data, do
//
//     final recipeList = recipeListFromJson(jsonString);

import 'dart:convert';

RecipeList recipeListFromJson(String str) => RecipeList.fromJson(json.decode(str));

String recipeListToJson(RecipeList data) => json.encode(data.toJson());

class RecipeList {
    RecipeList({
        this.q,
        this.from,
        this.to,
        this.more,
        this.count,
        this.hits,
        this.status,
        this.message,
    });

    String ? q;
    int ? from;
    int ? to;
    bool ? more;
    int ? count;
    List<Hit> ? hits;
    String ? status;
    String ? message;

    factory RecipeList.fromJson(Map<String, dynamic> json) => RecipeList(
        q: json["q"] == null ? null : json["q"],
        from: json["from"] == null ? null : json["from"],
        to: json["to"] == null ? null : json["to"],
        more: json["more"] == null ? null : json["more"],
        count: json["count"] == null ? null : json["count"],
        hits: json["hits"] == null ? null : List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toJson() => {
        "q": q == null ? null : q,
        "from": from == null ? null : from,
        "to": to == null ? null : to,
        "more": more == null ? null : more,
        "count": count == null ? null : count,
        "hits": hits == null ? null : List<dynamic>.from(hits!.map((x) => x.toJson())),
        "status": status == null ? null : status,
        "message": message == null ? null : message,
    };
}

class Hit {
    Hit({
        this.recipe,
    });

    Recipe ? recipe;

    factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        recipe: json["recipe"] == null ? null : Recipe.fromJson(json["recipe"]),
    );

    Map<String, dynamic> toJson() => {
        "recipe": recipe == null ? null : recipe!.toJson(),
    };
}

class Recipe {
    Recipe({
        this.uri,
        this.label,
        this.image,
        this.source,
        this.url,
        this.shareAs,
        this.recipeYield,
        this.calories,
    });

    String ? uri;
    String ? label;
    String ? image;
    String ? source;
    String ? url;
    String ? shareAs;
    double ? recipeYield;
    double ? calories;

    factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        uri: json["uri"] == null ? null : json["uri"],
        label: json["label"] == null ? null : json["label"],
        image: json["image"] == null ? null : json["image"],
        source: json["source"] == null ? null : json["source"],
        url: json["url"] == null ? null : json["url"],
        shareAs: json["shareAs"] == null ? null : json["shareAs"],
        recipeYield: json["yield"] == null ? null : json["yield"],
        calories: json["calories"] == null ? null : json["calories"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "uri": uri == null ? null : uri,
        "label": label == null ? null : label,
        "image": image == null ? null : image,
        "source": source == null ? null : source,
        "url": url == null ? null : url,
        "shareAs": shareAs == null ? null : shareAs,
        "yield": recipeYield == null ? null : recipeYield,
        "calories": calories == null ? null : calories,
    };
}
