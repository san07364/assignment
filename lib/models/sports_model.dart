import 'dart:convert';

List<SportsModel> sportsModelFromJson(String str) => List<SportsModel>.from(
    json.decode(str).map((x) => SportsModel.fromJson(x)));

// String sportsModelToJson(List<SportsModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SportsModel {
  SportsModel({
    this.createOn,
    this.updatedOn,
    this.id,
    this.images,
    this.files,
    this.name,
    this.dayOfWeeksOpen,
    this.openTime,
    this.closeTime,
    this.slotTimeSize,
    this.costPerSlot,
    this.active,
    this.establishment,
    this.sports,
  });

  DateTime createOn;
  DateTime updatedOn;
  var id;
  List<String> images;
  dynamic files;
  String name;
  List<String> dayOfWeeksOpen;
  String openTime;
  String closeTime;
  var slotTimeSize;
  var costPerSlot;
  dynamic active;
  dynamic establishment;
  Sports sports;

  factory SportsModel.fromJson(Map<String, dynamic> json) => SportsModel(
        createOn: DateTime.parse(json["createOn"]),
        updatedOn: DateTime.parse(json["updatedOn"]),
        id: json["id"],
        images: json["images"] == null
            ? null
            : List<String>.from(json["images"].map((x) => x)),
        files: json["files"],
        name: json["name"],
        dayOfWeeksOpen: List<String>.from(json["dayOfWeeksOpen"].map((x) => x)),
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        slotTimeSize: json["slotTimeSize"],
        costPerSlot: json["costPerSlot"],
        active: json["active"],
        establishment: json["establishment"],
        sports: Sports.fromJson(json["sports"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "createOn": createOn.toIso8601String(),
  //       "updatedOn": updatedOn.toIso8601String(),
  //       "id": id,
  //       "images":
  //           images == null ? null : List<dynamic>.from(images.map((x) => x)),
  //       "files": files,
  //       "name": name,
  //       "dayOfWeeksOpen": List<dynamic>.from(
  //           dayOfWeeksOpen.map((x) => dayOfWeeksOpenValues.reverse[x])),
  //       "openTime": openTimeValues.reverse[openTime],
  //       "closeTime": closeTimeValues.reverse[closeTime],
  //       "slotTimeSize": slotTimeSize,
  //       "costPerSlot": costPerSlot,
  //       "active": active,
  //       "establishment": establishment,
  //       "sports": sports.toJson(),
  //     };
}

class Sports {
  Sports({
    this.createOn,
    this.updatedOn,
    this.id,
    this.name,
    this.iconWhiteUrl,
    this.iconBlackUrl,
  });

  dynamic createOn;
  dynamic updatedOn;
  var id;
  var name;
  String iconWhiteUrl;
  String iconBlackUrl;

  factory Sports.fromJson(Map<String, dynamic> json) => Sports(
        createOn: json["createOn"],
        updatedOn: json["updatedOn"],
        id: json["id"],
        name: json["name"],
        iconWhiteUrl: json["iconWhiteUrl"],
        iconBlackUrl: json["iconBlackUrl"],
      );
}
