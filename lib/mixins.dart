
import 'package:galleryapp/models/user.dart';

mixin UserUtils{
  String capitalize(String s) =>
      s[0].toUpperCase() + s.substring(1).toLowerCase();
}
