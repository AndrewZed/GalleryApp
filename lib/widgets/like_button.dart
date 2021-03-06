import 'package:flutter/widgets.dart';
import 'package:galleryapp/res/app_icons.dart';

class LikeButton extends StatefulWidget {
  LikeButton({
    this.isLiked = false,
    this.likeCount = 0,
  });

  final bool isLiked;
  final int likeCount;

  @override
  State<StatefulWidget> createState() {
    return _LikeButtonState();
  }
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked;
  int likeCount;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
    likeCount = widget.likeCount;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            isLiked = !isLiked;
            if (isLiked) {
              likeCount++;
            } else {
              likeCount--;
            }
          });
        },
        child: Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              alignment: Alignment.centerRight,
              height: 36,
              width: 100,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(isLiked ? AppIcons.like_fill : AppIcons.like),
                  SizedBox(width: 4.21),
                  Text(likeCount.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          height: 16 / 14))
                ],
              ),
            )));
  }
}
