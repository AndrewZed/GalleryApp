import 'package:flutter/material.dart';
import 'package:galleryapp/res/res.dart';

class ButtonsGroup extends StatelessWidget {
  ButtonsGroup({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      _buildButton('Save'),
      SizedBox(width: 12),
      _buildButton('Visit'),
    ]);
  }
}

Widget _buildButton(String buttonText) {
  return SizedBox(
      height: 36,
      width: 105,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        child: FlatButton(
          child: Text(buttonText),
          textColor: Colors.white,
          color: AppColors.dodgerBlue,
          onPressed: () {},
        ),
      ));
}
