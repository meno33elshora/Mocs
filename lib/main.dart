import 'package:flutter/material.dart';
import 'package:mocs/data/data_source/local/shared_Pref_Helper.dart';
import 'package:mocs/presentation/pages/layout/controller/layout_provider.dart';
import 'package:mocs/presentation/pages/splash.dart';
import 'package:mocs/presentation/state_provider/auth_provider.dart';
import 'package:mocs/presentation/state_provider/categories_provider.dart';
import 'package:mocs/presentation/state_provider/get_home_data_provider.dart';
import 'package:mocs/presentation/state_provider/setting_provider.dart';
import 'package:mocs/utils/constants/constants.dart';
import 'package:mocs/utils/theme/theme_controller.dart';
import 'package:provider/provider.dart';
import 'data/data_source/remote/dio_base.dart';
import 'di/injection.dart' as di;

import 'config/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioBase.init();
  di.init();
  token = await CacheHelper.getData(key: 'tokenDb');
  passwordGlobalController.text =
      await CacheHelper.getData(key: 'password') ?? '';
  debugPrint('this is token  : $token');
  debugPrint('this is password  : ${passwordGlobalController.text.toString()}');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeController()),
        ChangeNotifierProvider(create: (_) => di.getIt<AuthProvider>()),
        ChangeNotifierProvider(
            create: (_) => di.getIt<GetHomeDataProvider>()
              ..getHomeDataProvider()
              ..getFavouriteProvider()
              ..getCartProvider()),
        ChangeNotifierProvider(
            create: (_) =>
                di.getIt<CategoriesProvider>()..getCategoriesProvider()),
        ChangeNotifierProvider(
            create: (_) => di.getIt<SettingProvider>()
              ..getContactDataProvider()
              ..getFqaDataProvider()
              ..getNotificationDataProvider()
              ..getTermsAndAboutDataProvider()
              ..getProfileDataProvider()),
        ChangeNotifierProvider(create: (_) => LayoutProvider()),
      ],
      child:
          Consumer<ThemeController>(builder: (context, themeController, child) {
        return MaterialApp(
          title: 'Mocs Shop',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(primarySwatch: Colors.amber, useMaterial3: true),
          themeMode: themeController.isDark ? ThemeMode.dark : ThemeMode.light,
          home: const Splash(),
          initialRoute: Routes.splashRoute,
          onGenerateRoute: RouteGenerator.getRoute,
        );
      }),
    );
  }
}
