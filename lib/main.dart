import 'package:get/get.dart';
import 'routes/app_routes.dart';
import 'screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'screens/news_detail_screen.dart';
import 'package:getxnewspai/models/news_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'News App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: AppRoutes.home,
          getPages: [
            GetPage(name: AppRoutes.home, page: () => HomeScreen()),
            GetPage(
              name: AppRoutes.newsDetail,
              page: () => NewsDetailScreen(news: Get.arguments as NewsModel),
            ),
          ],
        );
      },
    );
 
 
 
  }
}