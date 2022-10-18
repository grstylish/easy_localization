import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter_localization_example/translations/locale_keys.g.dart';



class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LocaleKeys.hello_text.tr()), 
            Text(LocaleKeys.edited.tr()),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              ElevatedButton(onPressed: () async{
                await context.setLocale(Locale('ru'));

              }, child: Text("RU")),
               ElevatedButton(
                 onPressed: () async{

                 await context.setLocale(Locale('kk'));
               }, 
               child: Text("KZ"))
            ],)
          ],
        ),
      ),
    );
  }
}