class HomeModel {
  bool ? status;
  HomeModelData ? data;

  HomeModel({this.data, this.status}) ;
  HomeModel.fromJson(Map<String , dynamic > json){
    status = json['status'];
    data = json['data'] != null ? HomeModelData.fromJson(json['data']) : null;
  }

}

class HomeModelData{
  List<BannerModel> banners = [];
  List<ProductModel> products = [];
  String ? ad;
  HomeModelData.fromJson(Map<String , dynamic>json){
    json['banners'].forEach((element){
      banners.add(BannerModel.fromJson(element));
    });
    json['products'].forEach((element){
      products.add(ProductModel.fromJson(element));
    });
    ad = json['ad'];
  }
}

class BannerModel{
  int ?id;
  String ?image;
  BannerModel.fromJson(Map<String , dynamic>json){
    id = json['id'];
    image = json['image'];
  }
}

class ProductModel{
  int ? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  bool? inFavorites;
  List<String >  images = [];
  bool? inCart;

  // ProductModel({
  //   this.id,
  //   this.price,
  //   this.oldPrice,
  //   this.discount,
  //   this.image,
  //   this.name,
  //   this.description,
  //   this.inCart,
  //   this.images,
  //   this.inFavorites,
  // });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    price = json["price"];
    oldPrice = json["old_price"];
    discount = json["discount"];
    image = json["image"];
    name = json["name"];
    description = json["description"];
    images = List.castFrom<dynamic, String>(json['images']);
    inCart = json["in_cart"];
    inFavorites = json["in_favorites"];
  }
}