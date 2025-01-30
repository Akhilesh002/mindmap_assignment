import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:hive_flutter/hive_flutter.dart";

import "ui/features/splash/screen/splash_screen.dart";
import "ui/features/transactions/models/transaction_model.dart";
import "util/util.dart";

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionModelAdapter());
  await Util.openBox();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => GetMaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
}
