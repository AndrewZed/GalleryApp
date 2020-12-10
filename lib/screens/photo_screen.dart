import 'package:flutter/material.dart';
import 'package:galleryapp/res/colors.dart';
import 'package:galleryapp/res/res.dart';
import 'package:galleryapp/widgets/description.dart';
import 'package:galleryapp/widgets/widgets.dart';

class FullScreenImageArguments {
  FullScreenImageArguments(
      {this.heroTag,
      this.altDescription,
      this.userName,
      this.name,
      this.userPhoto,
      this.photo,
      this.routeSettings,
      this.key});

  final String heroTag;
  final String altDescription;
  final String userName;
  final String name;
  final String userPhoto;
  final String photo;
  final Key key;
  final RouteSettings routeSettings;
}

class FullScreenImage extends StatefulWidget {
  FullScreenImage(
      {Key key,
      this.heroTag,
      this.altDescription,
      this.userName,
      this.name,
      this.userPhoto,
      this.photo})
      : super(key: key);

  final String heroTag;
  final String altDescription;
  final String userName;
  final String name;
  final String userPhoto;
  final String photo;

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
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildItem(context),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(height: 36, width: 105, child: LikeButton()),
                    SizedBox(width: 14),
                    Expanded(child: _buildButton('Save', () {})),
                    SizedBox(width: 14),
                    Expanded(
                        child: _buildButton('Visit', () async {
                      OverlayState overlayState = Overlay.of(context);
                      OverlayEntry overlayEntry =
                          OverlayEntry(builder: (BuildContext context) {
                        return Positioned(
                            top: MediaQuery.of(context).viewInsets.top + 50,
                            child: Material(
                              color: Colors.transparent,
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                                  decoration: BoxDecoration(
                                      color: AppColors.mercury,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Text('SkillBranch'),
                                ),
                              ),
                            ));
                      });

                      overlayState.insert(overlayEntry);
                      await Future.delayed(Duration(seconds: 1));
                      overlayEntry.remove();
                    })),
                    Divider(
                      thickness: 2,
                      color: AppColors.mercury,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 1,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.more_vert, color: AppColors.grayChateau),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          decoration: BoxDecoration(color: AppColors.mercury),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children:
                                List.generate(10, (index) => FlutterLogo()),
                          )));
                });
          },
        ),
      ],
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: AppColors.grayChateau),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text('Photo', style: AppStyles.h1Black),
      backgroundColor: AppColors.white,
      centerTitle: true,
    );
  }

  Widget _buildItem(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: widget.heroTag,
            child: Photo(photoLink: widget.photo),
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
                    intervalBegin: 0,
                    intervalEnd: 0.5,
                    childWidget: UserAvatar(widget.userPhoto)),
                SizedBox(width: 6),
                StaggerAnimation(
                    controller: _controller.view,
                    intervalBegin: 0,
                    intervalEnd: 1,
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

  Widget _buildButton(String text, VoidCallback callBack) {
    return GestureDetector(
        onTap: callBack,
        child: Container(
          alignment: Alignment.center,
          height: 36,
          width: 100,
          decoration: BoxDecoration(
            color: AppColors.dodgerBlue,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Text(text),
        ));
  }
}
