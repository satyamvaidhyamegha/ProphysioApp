class Recentactivity {
  late String name;
  late String desc;
  late String image;
  Recentactivity({
    required this.name,
    required this.image,
    required this.desc,
  });
}

List<Map<String, dynamic>> recentactivityval = [
  {
    "name": 'Appointment',
    "image": "assets/ic_date_range_24px.png",
    "desc": "Dr. Roma, 20 April, 3:00 pm, Online"
  },
  {
    "name": 'Report',
    "image": "assets/Group 74452.png",
    "desc": "Muscular Strength, 15 April, Manipal…"
  },
  {
    "name": 'Messages',
    "image": "assets/Glyphs-Tab Bar-Mail.png",
    "desc": "Ravi Sharma: Can you send me…"
  },
  {
    "name": 'Prescriptions',
    "image": "assets/Group 74452.png",
    "desc": "Metachlorophilin 20 mg, Dr. Sudesh"
  },
  {
    "name": 'Call',
    "image": "assets/Group 74452.png",
    "desc": "Today 3.15 am,Dr sudesh sharma"
  },
];
