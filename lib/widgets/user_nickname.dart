import 'package:flutter/widgets.dart';
import 'package:galleryapp/res/res.dart';

class UserNickname extends StatelessWidget {
  //TODO выносить конкретный текст со стилем в отдельный виджет слишком "жирно", а вот оба поля  - вполне годная идея, тем более тебе этот блок анимировать
  UserNickname(this.userNickname);

  final String userNickname;
  @override
  Widget build(BuildContext context) {
    return Text(userNickname,
        style: AppStyles.h5Black.copyWith(color: AppColors.manatee));
  }
}
