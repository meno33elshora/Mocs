import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../data/data_source/remote/dio_helper.dart';
import '../../model/add_cart_model.dart';
import '../../model/add_remove_favourite.dart';
import '../../model/get_cart_model.dart';
import '../../model/get_favourite_model.dart';
import '../../model/home_data_model.dart';
import '../../utils/constants/enums.dart';

class GetHomeDataProvider extends ChangeNotifier {
  DioHelper dioHelper;
  HomeModel homeModel;
  AddOrRemoveFavourite addOrRemoveFavourite;
  FavoriteModel favoriteModel;

  GetHomeDataProvider(
      {required this.dioHelper,
      required this.homeModel,
      required this.addOrRemoveFavourite,required this.favoriteModel});

  LoadingData? loadingData;
  int activeIndex = 0;

  // todo : suffix icon change
  void activeChange({required int active}) {
    activeIndex = active;
    notifyListeners();
  }

// todo : filtering product
  List<ProductModel> filteredProducts = [];

  void filterProducts({required String input}) {
    filteredProducts = homeModel.data!.products
        .where((element) =>
            element.name!.toLowerCase().startsWith(input.toLowerCase()))
        .toList();
    notifyListeners();
  }

  // todo : get home data to home screen

  Map<int, bool> favourites = {};
  Map<int, bool> carts = {};

  Future<dynamic> getHomeDataProvider() async {
    loadingData = LoadingData.LOADING;
    notifyListeners();
    await dioHelper.getHomeData().then((value) {
      homeModel = HomeModel.fromJson(value?.data);
      for (var element in (homeModel.data?.products)!) {
        favourites.addAll({element.id!: element.inFavorites!});
      }

      for (var element in (homeModel.data?.products)!) {
        carts.addAll({element.id!: element.inCart!});
      }
      loadingData = LoadingData.SUCCES;
      getFavouriteProvider();
      getCartProvider();
      debugPrint(value?.statusMessage.toString());
      notifyListeners();
    }).catchError((onError) {
      debugPrint(onError.toString());
      log(onError.toString());
      loadingData = LoadingData.ERROR;
    });
    notifyListeners();
  }

  Future<dynamic> addFavouriteProvider({required int productId}) async {
    favourites[productId]  =!  favourites[productId]!;
    loadingData = LoadingData.LOADING;
    notifyListeners();
    await dioHelper.addFavouriteProducts(productId: productId).then((value) {
      addOrRemoveFavourite = AddOrRemoveFavourite.fromJson(value?.data);
      if(!(addOrRemoveFavourite.status!)){
        favourites[productId]  =!  favourites[productId]!;
      }
      loadingData = LoadingData.SUCCES;
      getFavouriteProvider();
      notifyListeners();
    }).catchError((onError) {
      favourites[productId]  =!  favourites[productId]!;
      debugPrint(onError.toString());
      loadingData = LoadingData.ERROR;
      notifyListeners();
    });
    notifyListeners();
  }

  Future<dynamic> getFavouriteProvider() async {
    loadingData = LoadingData.LOADING;
    notifyListeners();
    await dioHelper.getFavouriteProducts().then((value) {
      favoriteModel = FavoriteModel.fromJson(value?.data);
      loadingData = LoadingData.SUCCES;
      notifyListeners();
    }).catchError((onError) {
      debugPrint(onError.toString());
      loadingData = LoadingData.ERROR;
      notifyListeners();
    });
    notifyListeners();
  }

  GetCartModel ? getCartModel;
  Future<dynamic> getCartProvider() async {
    loadingData = LoadingData.LOADING;
    notifyListeners();
    await dioHelper.getCartProduct().then((value) {
      getCartModel = GetCartModel.fromJson(value?.data);
      loadingData = LoadingData.SUCCES;
      notifyListeners();
    }).catchError((onError) {
      debugPrint(onError.toString());
      loadingData = LoadingData.ERROR;
      notifyListeners();
    });
    notifyListeners();
  }

  AddCartModel ? addCartModel;
  Future<dynamic> addCartProvider({required int productId}) async {
    carts[productId]  =!  carts[productId]!;
    loadingData = LoadingData.LOADING;
    notifyListeners();
    await dioHelper.addCartProduct(productId: productId).then((value) {
      addCartModel = AddCartModel.fromJson(value?.data);
      if(!addCartModel!.status){
        carts[productId]  =!  carts[productId]!;
      }
      loadingData = LoadingData.SUCCES;
      getCartProvider();
      notifyListeners();
    }).catchError((onError) {
      carts[productId]  =!  carts[productId]!;
      debugPrint(onError.toString());
      loadingData = LoadingData.ERROR;
      notifyListeners();
    });
    notifyListeners();
  }


}
