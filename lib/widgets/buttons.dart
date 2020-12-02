import 'package:flutter/material.dart';
import 'package:galleryapp/res/res.dart';

class CustomButton extends StatelessWidget {
  CustomButton(this.title, {Key key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 105,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        child: FlatButton(
          child: Text(title),
          textColor: Colors.white,
          color: AppColors.dodgerBlue,
          onPressed: () {},
        ),
      ));
   }
}