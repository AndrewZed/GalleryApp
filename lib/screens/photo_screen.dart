import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:galleryapp/res/colors.dart';
import 'package:galleryapp/res/styles.dart';
import 'package:galleryapp/widgets/widgets.dart';
import 'feed_screen.dart';

class PhotoScreen extends StatelessWidget {
  PhotoScreen({Key key, this.heroTag}) : super(key: key);
  String heroTag;

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Scaffold(
        body: Column(children: <Widget>[
      _buildItem(context),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: 36,
                width: 105,
                child: LikeButton(true, 10),
              ),
              ButtonsGroup(),
            ],
          ))
    ]));
  }

  Widget _buildItem(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MainTitle(),
          Photo(
            photoLink: kFlutterDash,
            heroTag: heroTag,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: (Text('This is Flutter dash. I love him',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.h3.copyWith(color: AppColors.black)))),
          _buildPhotoMeta(),
        ]);
  }

  Widget _buildPhotoMeta() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  UserAvatar(
                      'https://sun9-61.userapi.com/c9861/u10315956/a_7cec148f.jpg?ava=1'),
                  SizedBox(width: 6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      UserName('Andrew Bolshakov'),
                      Text('@AndrewZed',
                          style: AppStyles.h5Black
                              .copyWith(color: AppColors.manatee)),
                    ],
                  )
                ],
              ),
              Divider(
                thickness: 2,
                color: AppColors.mercury,
              ),
            ],
          )
        ]));
  }
}
