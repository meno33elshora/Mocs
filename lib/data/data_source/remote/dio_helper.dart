import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mocs/data/data_source/remote/base_dio_helper.dart';
import 'package:mocs/utils/constants/endPoint.dart';

import '../../../model/user_model.dart';
import '../../../utils/constants/constants.dart';
import 'dio_base.dart';

class DioHelper implements BaseDioHelper {
  DioBase dioBase;

  DioHelper({required this.dioBase});

  @override
  Future<Response?> login({
    required String email,
    required String password,
  }) async {
    var response = await dioBase.postData(
      url: '${baseUrl}login',
      data: {'email': email, 'password': password},
    );
    try {
      if (response?.statusCode == 200 && response?.statusCode == 201) {
        print(response?.statusMessage);
        return response;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response?> rejester({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    var response = await dioBase.postData(
      url: '${baseUrl}register',
      data: {
        'email': email,
        'password': password,
        'name': name,
        'phone': phone,
        'image': '',
      },
    );
    try {
      if (response?.statusCode == 200 && response?.statusCode == 201) {
        print(response?.statusMessage);
        return response;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response?> getHomeData() async {
    var response = await dioBase.getData(
      url: '${baseUrl}home',
      token: token,
    );
    try {
      if (response?.statusCode == 200 && response?.statusCode == 201) {
        print(response?.statusMessage);
        return response;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response?> getCategories() async {
    var response = await dioBase.getData(
      url: '${baseUrl}categories',
      token: token,
    );
    try {
      if (response?.statusCode == 200 && response?.statusCode == 201) {
        print(response?.statusMessage);
        return response;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response?> getContact() async {
    var response = await dioBase.getData(
      url: '${baseUrl}contacts',
      token: token,
    );
    try {
      if (response?.statusCode == 200 && response?.statusCode == 201) {
        print(response?.statusMessage);
        return response;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response?> getFrequanceyQuestion() async {
    var response = await dioBase.getData(
      url: '${baseUrl}faqs',
      token: token,
    );
    try {
      if (response?.statusCode == 200 && response?.statusCode == 201) {
        print(response?.statusMessage);
        return response;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response?> getNotifications() async {
    var response = await dioBase.getData(
      url: '${baseUrl}notifications',
      token: token,
    );
    try {
      if (response?.statusCode == 200 && response?.statusCode == 201) {
        print(response?.statusMessage);
        return response;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response?> getTermsAndAbout() async {
    var response = await dioBase.getData(
      url: '${baseUrl}settings',
      token: token,
    );
    try {
      if (response?.statusCode == 200 && response?.statusCode == 201) {
        print(response?.statusMessage);
        return response;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response?> getProfile() async {
    var response = await dioBase.getData(
      url: '${baseUrl}profile',
      token: token,
    );
    try {
      if (response?.statusCode == 200 && response?.statusCode == 201) {
        print(response?.statusMessage);
        return response;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response?> addCartProduct({required int productId}) async {
    var response = await dioBase.postFavouriteAdnCart(
      url: '${baseUrl}carts',
      data: {
        'product_id': productId,
      },
      token: token!,
    );
    try {
      if (response?.statusCode == 200 && response?.statusCode == 201) {
        print(response?.statusMessage);
        return response;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response?>  addFavouriteProducts({required int productId}) async {
      var response = await dioBase.postFavouriteAdnCart(
        url: '${baseUrl}favorites',
        data: {
          'product_id': productId,
        },
        token: token!,
      );
      try {
        if (response?.statusCode == 200 && response?.statusCode == 201) {
          print(response?.statusMessage);
          return response;
        }
      } catch (e) {
        debugPrint(e.toString());
      }
      return response;
  }

  @override
  Future<Response?> getCartProduct() async {
    var response = await dioBase.getData(
      url: '${baseUrl}carts',
      token: token,
    );
    try {
      if (response?.statusCode == 200 && response?.statusCode == 201) {
        print(response?.statusMessage);
        return response;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response?> getFavouriteProducts() async {
    var response = await dioBase.getData(
      url: '${baseUrl}favorites',
      token: token,
    );
    try {
      if (response?.statusCode == 200 && response?.statusCode == 201) {
        print(response?.statusMessage);
        return response;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response?> putProfile({
    required String email,
    required String name,
    required String phone,
    required String password,
  }) async {
    var response = await dioBase.putData(
      url: '${baseUrl}update-profile',
      data: {
        'email': email,
        'name': name,
        'phone': phone,
        'password': password,
      },
      token: token!,
    );
    try {
      if (response?.statusCode == 200 && response?.statusCode == 201) {
        print(response?.statusMessage);
        return response;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }


}
