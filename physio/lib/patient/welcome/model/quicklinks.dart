

import '../../../constants/string.dart';

class Quicklink {
  late String name;

  late String image;
  Quicklink({
    required this.name,
    required this.image,
  });
}

List<Map<String, dynamic>> quickcareval = [
  {"name": 'Appointments (2)', "image": "${ImagePath.BASE_IMAGE_PATH}/np_video_3136011_999999.png"},
  {"name": 'Reports (21)', "image": "${ImagePath.BASE_IMAGE_PATH}/np_report_2012339_000000.png"},
  {"name": 'Selfcare', "image": "${ImagePath.BASE_IMAGE_PATH}/np_heart_888700_000000.png"},
  {
    "name": 'My Exercises (24)',
    "image": "${ImagePath.BASE_IMAGE_PATH}/np_exercise_637460_000000.png"
  },
];
