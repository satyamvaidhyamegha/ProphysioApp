class DoctorCard {
  late String name;
  late String title;
  late String subtext;
  late String date;
  late String doctorname;
  late String image;
  DoctorCard({
    required this.name,
    required this.image,
    required this.subtext,
    required this.date,
    required this.doctorname,
    required this.title,
  });
}

List<Map<String, dynamic>> doctorCardval = [
  {
    "name": "Dr. Soham",
    "title": "Muscle Constitution",
    "subtext":
        'This is back pain where no specific \ncause (such as an underlying…',
    "date": "13/5/2020",
    "doctorname": "Report by Dr. Soham",
    "image": "assets/Path 38263.png"
  },
  {
    "name": "Dr. Soham",
    "title": "Assessment Report",
    "subtext":
        'This is back pain where no specific \ncause (such as an underlying…',
    "date": "13/5/2020",
    "doctorname": "Report by Dr. Soham",
    "image": "assets/Path 38263.png"
  },
  {
    "name": "Dr. Soham",
    "title": "Muscle Constitution",
    "subtext":
        'This is back pain where no specific \ncause (such as an underlying…',
    "date": "13/5/2020",
    "doctorname": "Report by Dr. Soham",
    "image": "assets/Group 74709.png"
  },
  {
    "name": "Dr. Soham",
    "title": "Assessment Report",
    "subtext":
        'This is back pain where no specific \ncause (such as an underlying…',
    "date": "13/5/2020",
    "doctorname": "Report by Dr. Soham",
    "image": "assets/Group 74709.png"
  },
];
