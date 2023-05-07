class ContactModel {
  bool? status;
  DataModel? data;

  ContactModel({this.data, this.status});

  ContactModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    data = json["data"] != null ? DataModel.fromJson(json["data"]) : null;
  }
}

class DataModel {
  List<Data> data = [];

  DataModel.fromJson(Map<String, dynamic> json) {
    json["data"].forEach((element) {
      data.add(Data.fromJson(element));
    });
  }
}

class Data {
  int? id;
  int? type;
  String? value;
  String? image;

  Data({this.id, this.image, this.value, this.type});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    type = json["type"];
    value = json["value"];
    image = json["image"];
  }
}
