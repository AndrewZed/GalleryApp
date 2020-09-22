import 'package:flutter/widgets.dart';
import 'package:galleryapp/res/res.dart';

class UserNickname extends StatelessWidget {
  UserNickname(this.userNickname);

  final String userNickname;
  @override
  Widget build(BuildContext context) {
    return Text(userNickname,
                        style: AppStyles.h5Black
                            .copyWith(color: AppColors.manatee));
  }
}
