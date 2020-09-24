import 'package:flutter/material.dart';
import 'package:galleryapp/res/colors.dart';
import 'package:galleryapp/res/res.dart';
import 'package:galleryapp/widgets/description.dart';
import 'package:galleryapp/widgets/widgets.dart';
import 'feed_screen.dart';

class PhotoScreen extends StatelessWidget {
  PhotoScreen({Key key, this.heroTag}) : super(key: key);
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Photo', style: AppStyles.h1Black),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: <Widget>[
          _buildItem(context),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 36,
                  width: 105,
                  child: LikeButton(true, 10)),
                SizedBox(width: 12),
                CustomButton('Save'),
                SizedBox(width: 12),
                CustomButton('Visit'),
                Divider(
                  thickness: 2,
                  color: AppColors.mercury,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: heroTag,
            child: Photo(photoLink: kFlutterDash),
          ),
          Description('This is Flutter dash. I love him'),
          _buildPhotoMeta(),
        ]);
  }

// TODO row и column проверить на избыточность
  Widget _buildPhotoMeta() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                UserAvatar(
                    'https://sun9-61.userapi.com/c9861/u10315956/a_7cec148f.jpg?ava=1'),
                SizedBox(width: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Andrew Bolshakov', style: AppStyles.h2Black),
                    Text('@AndrewZed',
                        style: AppStyles.h5Black
                            .copyWith(color: AppColors.manatee)),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
