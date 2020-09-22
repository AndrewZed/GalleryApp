import 'package:flutter/widgets.dart';
import 'package:galleryapp/res/res.dart';

class UserName extends StatelessWidget {
  UserName(this.userName);

  final String userName;
  @override
  Widget build(BuildContext context) {
    return Text(userName, style: AppStyles.h2Black);
  }
}
