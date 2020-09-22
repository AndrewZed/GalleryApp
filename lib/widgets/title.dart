import 'package:flutter/material.dart';
import 'package:galleryapp/res/res.dart';

class MainTitle extends StatelessWidget {
  MainTitle();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Photo', 
        style: AppStyles.h1Black),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      shadowColor: Colors.transparent,
      );
  }
}
