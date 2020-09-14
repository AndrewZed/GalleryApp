import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleryapp/res/colors.dart';

class Photo extends StatelessWidget {
  Photo({Key key, this.photoLink, this.onTap, this.heroTag}) : super(key: key);

  final String photoLink;
  final VoidCallback onTap;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(17)),
        child: Container(
            color: AppColors.grayChateau,
            child: Hero(
                tag: heroTag,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                  onTap: onTap,
                  child: CachedNetworkImage(
                    imageUrl: photoLink,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.fill,
                  ),
                )
              )
            ),
      ),
    ));
  }
}
