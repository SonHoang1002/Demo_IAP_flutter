import 'package:demo_iap_flutter/a_test/store_page.dart';
import 'package:demo_iap_flutter/common/themes.dart';
import 'package:flutter/material.dart';
 
class MaterialWithTheme extends StatefulWidget {
  // final bool isOnBoard;

  const MaterialWithTheme({
    super.key,
    // required this.isOnBoard,
  });

  @override
  State<MaterialWithTheme> createState() => _MaterialWithThemeState();
}

class _MaterialWithThemeState extends State<MaterialWithTheme> {
  @override
  void initState() {
    super.initState(); 
  }

  @override
  Widget build(BuildContext context) {
    Widget homeWidget =  StorePage();
    return MaterialApp(
        title: 'Resize Photos',
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        home: homeWidget,
     
    );
  }
}
