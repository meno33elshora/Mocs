class TermAndAboutModel{
  bool ? status;
  Data ? data;

  TermAndAboutModel({this.data , this.status});

  TermAndAboutModel.fromJson(Map<String , dynamic> json){
    status = json["status"];
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }
}

class Data{
  String ? about;
  String ? terms;

  Data({this.about , this.terms});
  Data.fromJson(Map<String , dynamic> json){
    about = json["about"];
    terms = json["terms"];
  }
}