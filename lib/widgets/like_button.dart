import 'package:flutter/widgets.dart';
import 'package:galleryapp/res/app_icons.dart';

class LikeButton extends StatefulWidget {
  LikeButton(this.isLiked, this.likeCount, {Key key}) : super(key: key);

  final int likeCount;
  final bool isLiked;

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
      onTap: (){
        setState(() {
          isLiked =!isLiked;
          if (isLiked){likeCount++;}
          else {likeCount--;}         
        });
      },
      child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(isLiked ? AppIcons.like_fill : AppIcons.like),
                SizedBox(width: 4.6),
                Text(likeCount.toString())
                 ],
            ),
          )
    );
  }
}
