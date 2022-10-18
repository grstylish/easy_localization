import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization_example/home.dart';
import 'package:flutter_localization_example/translations/codegen_loader.g.dart';

void main() async {
  //1. the WidgetFlutterBinding is used to interact with the Flutter engine.
  //2. EasyLocalization.initializeApp() needs to call native code to initialize EasyLocalization, and since the plugin needs to use platform channels to call the native code, which is done asynchronously therefore you have to call ensureInitialized() to make sure that you have an instance of the WidgetsBinding.
  //3. You only need to call this method if you need the binding to be initialized before calling runApp.
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      child: MyApp(),
      supportedLocales: [
        //4. LanguageCode
        Locale('kk'),
        Locale('ru')
      ],
      path: 'assets/translations',
      // Returns the locale when the locale is not in the list
      //it is not mandatory
      fallbackLocale: Locale('ru'),
      assetLoader: CodegenLoader(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
