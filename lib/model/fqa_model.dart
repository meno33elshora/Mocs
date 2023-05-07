class FqaModel{
  bool ? status;
  Model  ? data;

  FqaModel({this.status , this.data});
  FqaModel.fromJson(Map<String , dynamic> json){
    status = json["status"];
    data = json["data"] !=null ? Model.fromJson(json["data"]) : null;
  }
}

class Model{
  List<Data> model = [];

  Model.fromJson(Map<String , dynamic> json){

    json["data"].forEach((element){
      model.add(Data.fromJson(element));
    });
  }
}
class Data{
  int ? id;
  String ? question;
  String ? answer;

  Data.fromJson(Map<String , dynamic> json){
    id = json["id"];
    question = json["question"];
    answer = json["answer"];
  }
}