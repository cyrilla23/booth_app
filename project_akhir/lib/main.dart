import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_akhir/config/asset.dart';
import 'package:project_akhir/screen/login.dart';
import 'package:project_akhir/screen/admin/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return get Material(
      theme: ThemeData(
        primaryColor: Asset.colorPrimaryDark,
        scaffoldBackgroundColor: Colors.white,

      ),
      debugShowCheckedModeBanner: false,
      home: DashboardAdmin(),
    );
  }
}
