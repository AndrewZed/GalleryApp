import 'package:flutter/material.dart';
import 'package:galleryapp/res/colors.dart';
import 'package:galleryapp/res/res.dart';
import 'package:galleryapp/widgets/description.dart';
import 'package:galleryapp/widgets/widgets.dart';

class FullScreenImage extends StatefulWidget {
  FullScreenImage(
      {Key key,
      this.heroTag,
      this.altDescription,
      this.userName,
      this.name,
      this.userPhoto,
      this.kFlutterDash})
      : super(key: key);

  final String heroTag;
  final String altDescription;
  final String userName;
  final String name;
  final String userPhoto;
  final String kFlutterDash;

  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    _controller.forward();
  }

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
                SizedBox(height: 36, width: 105, child: LikeButton(true, 10)),
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
            tag: widget.heroTag,
            child: Photo(photoLink: widget.kFlutterDash),
          ),
          Description(widget.altDescription),
          _buildPhotoMeta(),
        ]);
  }

  Widget _buildPhotoMeta() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                StaggerAnimation(
                    controller: _controller.view,
                    opacityEnd: 1,
                    childWidget: UserAvatar(widget.userPhoto)),
                SizedBox(width: 6),
                StaggerAnimation(
                    controller: _controller.view,
                    opacityEnd: 0.5,
                    childWidget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(widget.name, style: AppStyles.h2Black),
                        Text(widget.userName,
                            style: AppStyles.h5Black
                                .copyWith(color: AppColors.manatee)),
                      ],
                    ))
              ],
            ),
          ],
        ));
  }
}
