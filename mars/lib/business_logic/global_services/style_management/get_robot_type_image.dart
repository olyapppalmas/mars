import 'package:mars/interface/style_guide/image_urls.dart';

String returnRobotTypeImageUrl(String type) {
  String imageUrl = '';

  switch (type) {
    case 'type 1':
      {
        imageUrl = TYPE_1;
      }
      break;

    case 'type 2':
      {
        imageUrl = TYPE_2;
      }
      break;

    case 'type 3':
      {
        imageUrl = TYPE_3;
      }
      break;
  }

  return imageUrl;
}
