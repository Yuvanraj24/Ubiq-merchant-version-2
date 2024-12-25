import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubiqmerchant_version_2/core/routes/pages.dart';
import 'package:ubiqmerchant_version_2/core/theme/custom_themes/appbar_theme.dart';
import 'package:ubiqmerchant_version_2/core/theme/theme.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      initialRoute: Routes.splash,
    );
  }
}


