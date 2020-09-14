import 'package:flutter/material.dart';
import 'package:galleryapp/res/colors.dart';
import 'package:galleryapp/res/styles.dart';
import 'package:galleryapp/widgets/widgets.dart';

const kFlutterDash ='https://flutter.dev/assets/404/dash_nest-c64796b59b65042a2b40fae5764c13b7477a592db79eaf04c86298dcb75b78ea.png';

class Feed extends StatefulWidget {
  Feed({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FeedState();
  }
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
      return Column(children: <Widget>[
        _buildItem(),
        Divider(thickness: 2, color: AppColors.mercury,),
      ]);
    }));
  }

  Widget _buildItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Photo(photoLink: kFlutterDash),
        _buildPhotoMeta(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child:( 
            Text('This is Flutter dash. I love him',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.h3.copyWith(color: AppColors.black)
            )
          ))
      ]
    );
  }

  Widget _buildPhotoMeta() {
    return Padding(padding:
    EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(children: <Widget>[
          UserAvatar('https://sun9-61.userapi.com/c9861/u10315956/a_7cec148f.jpg?ava=1'),
          SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text('Andrew Bolshakov', style: AppStyles.h2Black),
            Text('@AndrewZed', style: AppStyles.h5Black.copyWith(color: AppColors.manatee)), 
          ],)
        ],
        ),
      LikeButton(true, 10)
      ],
    ));
  }
}
