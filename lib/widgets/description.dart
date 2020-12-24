import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:galleryapp/res/res.dart';

class Description extends StatelessWidget {
  Description(this.description);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: (Text(description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline3.copyWith(
                color: AppColors.manatee))));
  }
}
