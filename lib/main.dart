import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ubiqmerchant_version_2/core/routes/pages.dart';
import 'package:ubiqmerchant_version_2/core/theme/theme.dart';
import 'package:ubiqmerchant_version_2/data/api/services/network_manager/network_manager.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(NetworkManager());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: SiajAppTheme.lightTheme,
      getPages: AppPages.routes,
      initialRoute: Routes.splash
    );
  }
}


