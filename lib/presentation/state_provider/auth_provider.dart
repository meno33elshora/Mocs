import 'package:flutter/material.dart';
import '../../data/data_source/remote/dio_helper.dart';
import '../../model/user_model.dart';
import '../../utils/constants/enums.dart';


class AuthProvider extends ChangeNotifier {
  DioHelper dioHelper;
  UserModel userModel;

  AuthProvider({required this.dioHelper, required this.userModel});

  StautsMessage? stautsMessage;

  Future<dynamic> loginProvider(
      {required String email, required String password}) async {
    stautsMessage = StautsMessage.LOADING;
    notifyListeners();
    await dioHelper.login(email: email, password: password).then((value) {
      userModel = UserModel.fromJson(value?.data);
      stautsMessage = StautsMessage.SUCCES;
      debugPrint('${userModel.status}');
    }).catchError((onError) {
      debugPrint(onError.toString());
      stautsMessage = StautsMessage.ERROR;
    });
    notifyListeners();
  }

  Future<dynamic> registerProvider({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    stautsMessage = StautsMessage.LOADING;
    notifyListeners();
    await dioHelper
        .rejester(email: email, password: password, name: name, phone: phone)
        .then((value) {
      userModel = UserModel.fromJson(value?.data);
      stautsMessage = StautsMessage.SUCCES;
      debugPrint('${userModel.status}');
    }).catchError((onError) {
      debugPrint(onError.toString());
      stautsMessage = StautsMessage.ERROR;
    });
    notifyListeners();
  }
}
