import 'package:flutter/material.dart';
import 'package:galleryapp/res/res.dart';

//TODO название класса не соответствует содержимому. Title != AppBar
class MainTitle extends StatelessWidget {
  MainTitle();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //TODO use leading: for back action,
      title: Text('Photo', style: AppStyles.h1Black),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      shadowColor: Colors.transparent,
    );
  }
}
