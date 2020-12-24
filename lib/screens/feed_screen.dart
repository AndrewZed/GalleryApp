import 'package:flutter/material.dart';
import 'package:galleryapp/res/colors.dart';
import 'package:galleryapp/res/res.dart';
import 'package:galleryapp/screens/photo_screen.dart';
import 'package:galleryapp/widgets/description.dart';
import 'package:galleryapp/widgets/widgets.dart';

const kFlutterDash =
    'https://flutter.dev/assets/404/dash_nest-c64796b59b65042a2b40fae5764c13b7477a592db79eaf04c86298dcb75b78ea.png';

class Feed extends StatefulWidget {
  Feed({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FeedState();
  }
}

class _FeedState extends State<Feed> {
  final String userPhoto =
      'https://sun9-61.userapi.com/c9861/u10315956/a_7cec148f.jpg?ava=1';
  final String altDescription = 'This is Flutter dash. I love him';
  final String name = 'Andrew Bolshakov';
  final String userName = '@AndrewZed';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Column(children: <Widget>[
                _buildItem(context, index),
                Divider(
                  thickness: 2,
                  color: AppColors.mercury,
                ),
              ]);
            }));
  }

  Widget _buildItem(BuildContext context, index) {
    String heroTag = 'feedItem_$index';
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/fullScreenImage',
                    arguments: FullScreenImageArguments(
                        routeSettings: RouteSettings(arguments: 'Some title'),
                        heroTag: heroTag,
                        altDescription: altDescription,
                        userPhoto: userPhoto,
                        name: name,
                        userName: userName,
                        photo: kFlutterDash));
              },
              child: Hero(tag: heroTag, child: Photo(photoLink: kFlutterDash))),
          _buildPhotoMeta,
          Description(altDescription)
        ]);
  }

  Widget get _buildPhotoMeta {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                UserAvatar(userPhoto),
                SizedBox(width: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(name, style: Theme.of(context).textTheme.headline2),
                    Text(userName,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: AppColors.manatee)),
                  ],
                )
              ],
            ),
            LikeButton()
          ],
        ));
  }
}
