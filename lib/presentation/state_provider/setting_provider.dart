import 'package:flutter/cupertino.dart';

import '../../data/data_source/remote/dio_helper.dart';
import '../../model/contact_model.dart';
import '../../model/fqa_model.dart';
import '../../model/notification_model.dart';
import '../../model/profile_dataModel.dart';
import '../../model/term_about.dart';
import '../../utils/constants/enums.dart';

class SettingProvider extends ChangeNotifier {
  FqaModel fqaModel;
  ContactModel contactModel;
  NotificationModel notificationModel;
  TermAndAboutModel termAndAboutModel;
  ProfileData profileData;
  DioHelper dioHelper;

  SettingProvider({
    required this.fqaModel,
    required this.contactModel,
    required this.notificationModel,
    required this.termAndAboutModel,
    required this.profileData,
    required this.dioHelper,
  });

  StautsMessage? stautsMessage;

  bool obt = true;

  void methodObt ({required bool isObt}){
    obt = !obt;
    notifyListeners();
  }
  // update profile
  Future<dynamic> putProfileProvider({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    stautsMessage = StautsMessage.LOADING;
    notifyListeners();
    await dioHelper
        .putProfile(email: email, name: name, phone: phone,password : password)
        .then((value) {
      profileData = ProfileData.fromJson(value?.data);
      stautsMessage = StautsMessage.SUCCES;
      debugPrint('${profileData.status}');
    }).catchError((onError) {
      debugPrint(onError.toString());
      stautsMessage = StautsMessage.ERROR;
    });
    notifyListeners();
  }

  Future<dynamic> getFqaDataProvider() async {
    stautsMessage = StautsMessage.LOADING;
    notifyListeners();
    await dioHelper.getFrequanceyQuestion().then((value) {
      fqaModel = FqaModel.fromJson(value?.data);
      stautsMessage = StautsMessage.SUCCES;
      debugPrint('${fqaModel.status}');
    }).catchError((onError) {
      debugPrint(onError.toString());
      stautsMessage = StautsMessage.ERROR;
    });
    notifyListeners();
  }

  Future<dynamic> getContactDataProvider() async {
    stautsMessage = StautsMessage.LOADING;
    notifyListeners();
    await dioHelper.getContact().then((value) {
      contactModel = ContactModel.fromJson(value?.data);
      stautsMessage = StautsMessage.SUCCES;
      debugPrint('${contactModel.status}');
    }).catchError((onError) {
      debugPrint(onError.toString());
      stautsMessage = StautsMessage.ERROR;
    });
    notifyListeners();
  }

  Future<dynamic> getNotificationDataProvider() async {
    stautsMessage = StautsMessage.LOADING;
    notifyListeners();
    await dioHelper.getNotifications().then((value) {
      notificationModel = NotificationModel.fromJson(value?.data);
      stautsMessage = StautsMessage.SUCCES;
      debugPrint('${notificationModel.status}');
    }).catchError((onError) {
      debugPrint(onError.toString());
      stautsMessage = StautsMessage.ERROR;
    });
    notifyListeners();
  }

  Future<dynamic> getTermsAndAboutDataProvider() async {
    stautsMessage = StautsMessage.LOADING;
    notifyListeners();
    await dioHelper.getTermsAndAbout().then((value) {
      termAndAboutModel = TermAndAboutModel.fromJson(value?.data);
      stautsMessage = StautsMessage.SUCCES;
      debugPrint('${termAndAboutModel.status}');
    }).catchError((onError) {
      debugPrint(onError.toString());
      stautsMessage = StautsMessage.ERROR;
    });
    notifyListeners();
  }

  Future<dynamic> getProfileDataProvider() async {
    stautsMessage = StautsMessage.LOADING;
    notifyListeners();
    await dioHelper.getProfile().then((value) {
      profileData = ProfileData.fromJson(value?.data);
      stautsMessage = StautsMessage.SUCCES;
      debugPrint('${profileData.data?.email}');
    }).catchError((onError) {
      debugPrint(onError.toString());
      stautsMessage = StautsMessage.ERROR;
    });
    notifyListeners();
  }
}
