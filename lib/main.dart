import 'package:app/models/liked_model.dart';
import 'package:app/models/my_dark_theme.dart';
import 'package:app/models/my_light_theme.dart';
import 'package:app/models/savings_model.dart';
import 'package:app/models/theme_model.dart';
import 'package:app/pages/animated_page.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/pages/my_savings_page.dart';
import 'package:app/pages/recommendation_page.dart';
import 'package:app/pages/show_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'objects/post.dart';

bool showBackToTopButton = false;
late ScrollController mainScrollController;



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Instagram';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => PostModel()),
        ChangeNotifierProxyProvider<PostModel, SavingsModel>(
          create: (context) => SavingsModel(),
          update: (context, postList, savingList) {
            if (savingList == null) throw ArgumentError.notNull('savingList');
            savingList.post = postList;
            return savingList;
          },
        ),
        ChangeNotifierProxyProvider<PostModel, LikedModel>(
          create: (context) => LikedModel(),
          update: (context, postList, likedList) {
            if (likedList == null) throw ArgumentError.notNull('savingList');
            likedList.post = postList;
            return likedList;
          },
        ),
      ],
      child: ChangeNotifierProvider(
        create: (context) => ThemeModel(),
        child: Consumer<ThemeModel>(
            builder: (context, ThemeModel themeNotifier, child) {
          return MaterialApp(
            theme: themeNotifier.isDark
                ? MyDarkTheme().getTheme()
                : MyLightTheme().getTheme(),
            title: _title,
            initialRoute: "/home",
        
            routes: {
              "/home": (context) => const HomePage(),
              "/recommendation": (context) => const ReccomendationPage(),
              "/add": (context) => const LogoApp(),
              "/statistics": (context) => const AdditionalPage(),
              "/savings": (context) => const MySavings(),
            },
          );
        }),
      ),
    );
  }
}