class Appointment {
  late String time;
  late String name;
  late String desc;
  late String month;
  late String date;
  late String image;
  Appointment({
    required this.time,
    required this.name,
    required this.month,
    required this.date,
    required this.desc,
  });
}

List<Map<String, dynamic>> appointmentval = [
  {
    "time": "4:00pm - 5:00pm",
    "name": 'Dr. Roma Desouza',
    "month": "May | Sat",
    "date": "22",
    "desc": "In-person Appointment",
  },
  {
    "time": "4:00pm - 5:00pm",
    "name": 'Dr. Roma Desouza',
    "month": "May | Sat",
    "date": "02",
    "desc": "Online Appointment",
  },
  {
    "time": "4:00pm - 5:00pm",
    "name": 'Dr. Roma Desouza',
    "month": "May | Sat",
    "date": "25",
    "desc": "Initial Assesment Online",
  },
  {
    "time": "4:00pm - 5:00pm",
    "name": 'Dr. Roma Desouza',
    "month": "May | Sat",
    "date": "18",
    "desc": "In-person Appointment",
  },
  {
    "time": "4:00pm - 5:00pm",
    "name": 'Dr. Roma Desouza',
    "month": "May | Sat",
    "date": "22",
    "desc": "In-person Appointment",
  },
];
