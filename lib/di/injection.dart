import 'package:get_it/get_it.dart';
import 'package:mocs/data/data_source/remote/dio_base.dart';
import 'package:mocs/data/data_source/remote/dio_helper.dart';
import 'package:mocs/model/get_favourite_model.dart';
import 'package:mocs/model/user_model.dart';
import 'package:mocs/presentation/state_provider/auth_provider.dart';
import '../model/add_remove_favourite.dart';
import '../model/categories_model.dart';
import '../model/contact_model.dart';
import '../model/fqa_model.dart';
import '../model/home_data_model.dart';
import '../model/notification_model.dart';
import '../model/profile_dataModel.dart';
import '../model/term_about.dart';
import '../presentation/state_provider/categories_provider.dart';
import '../presentation/state_provider/get_home_data_provider.dart';
import '../presentation/state_provider/setting_provider.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton(
      () => AuthProvider(dioHelper: getIt(), userModel: getIt()));
  getIt.registerLazySingleton(
      () => GetHomeDataProvider(dioHelper: getIt(), homeModel: getIt(),addOrRemoveFavourite: getIt(), favoriteModel: getIt()));
  getIt.registerLazySingleton(
      () => CategoriesProvider(dioHelper: getIt(), categoriesModel: getIt()));
  getIt.registerLazySingleton(() => SettingProvider(
        dioHelper: getIt(),
        fqaModel: getIt(),
        contactModel: getIt(),
        notificationModel: getIt(),
        termAndAboutModel: getIt(),
        profileData: getIt(),

      ));
  getIt.registerLazySingleton(() => UserModel());
  getIt.registerLazySingleton(() => HomeModel());
  getIt.registerLazySingleton(() => CategoriesModel());
  getIt.registerLazySingleton(() => FqaModel());
  getIt.registerLazySingleton(() => ContactModel());
  getIt.registerLazySingleton(() => NotificationModel());
  getIt.registerLazySingleton(() => TermAndAboutModel());
  getIt.registerLazySingleton(() => ProfileData());
  getIt.registerLazySingleton(() => AddOrRemoveFavourite());
  getIt.registerLazySingleton(() => FavoriteModel());
  getIt.registerLazySingleton(() => DioHelper(dioBase: getIt()));
  getIt.registerLazySingleton(() => DioBase());
}

// FqaModel fqaModel;
//   ContactModel contactModel;
//   NotificationModel notificationModel;
//   TermAndAboutModel termAndAboutModel;
//   ProfileData profileData;
