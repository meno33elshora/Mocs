

import 'package:flutter/cupertino.dart';

import '../../data/data_source/remote/dio_helper.dart';
import '../../model/categories_model.dart';
import '../../utils/constants/enums.dart';

class CategoriesProvider extends ChangeNotifier{
  DioHelper dioHelper;
  CategoriesModel  categoriesModel;

  CategoriesProvider({required this.dioHelper, required this.categoriesModel});

  LoadingData? loadingData;

  Future<dynamic> getCategoriesProvider() async {
    loadingData = LoadingData.LOADING;
    notifyListeners();
    await dioHelper.getCategories().then((value) {
      categoriesModel = CategoriesModel.fromJson(value?.data);
      loadingData = LoadingData.SUCCES;
      debugPrint('${categoriesModel.status}');
    }).catchError((onError) {
      debugPrint(onError.toString());
      loadingData = LoadingData.ERROR;
    });
    notifyListeners();
  }
}