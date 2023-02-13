import 'package:flutter/material.dart';
import 'package:get_it_down/models/item.dart';
import 'package:get_it_down/models/items_data.dart';
import 'package:get_it_down/screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

import 'models/color_theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ColorThemeData().creatrPrefObject();
  await ItemsData().creatPrefObject();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ItemsData>(
        create: (BuildContext context) => ItemsData()),
    ChangeNotifierProvider<ColorThemeData>(
        create: (context) => ColorThemeData()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Provider.of<ColorThemeData>(context).loadThemeFromSharedPref();
    //Provider.of<ItemsData>(context).loadItemsFormSharedPref();
    return Consumer2<ItemsData, ColorThemeData>(
        builder: (context, itemData, colorThemData, child) {
          itemData.loadItemsFormSharedPref();
          colorThemData.loadThemeFromSharedPref();
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ColorThemeData>(context).selectedThemaData,
        home: SplashWidget(),
      );
    });
  }
}
class SplashWidget extends StatelessWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new HomePage(),
        title: new Text('GET IT DOWN',style: GoogleFonts.bangers(fontSize: 30),),
        image: new Image.asset('assets/images/logo.png'),
        backgroundColor: Color(0x0ffFBCD08),
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.red
    );
  }
}

