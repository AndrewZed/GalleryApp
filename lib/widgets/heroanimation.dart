import 'package:flutter/cupertino.dart';

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({Key key, this.heroTag, this.onTap, this.widget})
      : super(key: key);

  final String heroTag;
  final VoidCallback onTap;
  final Widget widget;

  Widget build(BuildContext context) {
    //TODO тебе не надо тут клик, соответственно весь класс не совсем нужен!
    return GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: heroTag,
          child: widget,
        ));
  }
}
