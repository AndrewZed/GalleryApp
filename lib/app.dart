import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleryapp/screens/home.dart';

import 'screens/photo_screen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings setting) {
        if (setting.name == '/fullScreenImage') {
          FullScreenImageArguments args =
              setting.arguments as FullScreenImageArguments;
          final route = FullScreenImage(
            photo: args.photo,
            altDescription: args.altDescription,
            heroTag: args.heroTag,
            key: key,
            name: args.name,
            userName: args.userName,
            userPhoto: args.userPhoto,
          );
          if (Platform.isAndroid) {
            return MaterialPageRoute(builder: (context) => route, settings: args.routeSettings);
          } else if (Platform.isIOS) {
            return CupertinoPageRoute(builder: (context) => route, settings: args.routeSettings); 
          }
        }
      },
      home: Home(),
    );
  }
}
