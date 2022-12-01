

import '../../../constants/string.dart';

class Selfheal {
  late String title;
  late String name;
  late String desc;
  late String image;
  Selfheal({
    required this.title,
    required this.name,
    required this.desc,
    required this.image,
  });
}

List<Map<String, dynamic>> selfhealval = [
  {
    "title": "Breath",
    "name": 'Breath away your pain',
    "desc":
        "A 2min guided breathing audio visual \nthat aims at calming you down.",
    "image": "${ImagePath.BASE_IMAGE_PATH}/water-2725337_1920.png"
  },
  {
    "title": "Listen",
    "name": 'Bring balance within',
    "desc":
        "listen to 3 mins of music that is naturally \n healing and soothing to the brain",
    "image": "${ImagePath.BASE_IMAGE_PATH}/Mask Group 138.png"
  },
  {
    "title": "meditating",
    "name": 'A healing towards journey',
    "desc":
        "listen to 3 mins of music that is naturally \n healing and soothing to the brain",
    "image": "${ImagePath.BASE_IMAGE_PATH}/Mask Group 138.png"
  },
];
