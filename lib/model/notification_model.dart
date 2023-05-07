class NotificationModel {
  bool? status;
  DataModel? data;

  NotificationModel({this.data, this.status});

  NotificationModel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? message;

  Data({this.id, this.message, this.title});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    message = json["message"];
  }
}
