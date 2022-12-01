// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../BaseWidget/basic_app_bar.dart';
import '../../../BaseWidget/bottom_sheet_icon.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/editprofilefield.dart';
import '../../../BaseWidget/style.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/apipath.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';
import 'address_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditprofilePage extends StatefulWidget {
  const EditprofilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EditprofilePagePageState();
  }
}

class _EditprofilePagePageState extends State<EditprofilePage> {
  String date = "";
  DateTime selectedDate = DateTime.now();
  TextEditingController dateinput = TextEditingController();
  final editControllerdropvalue = TextEditingController();
  final editControllercalender = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController secondName = TextEditingController();
  final List<String> _items = ["Male", "Female", "Other"];
  late int age;
  var _value;
  File? image;
  final _picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      Navigator.pop(context);
      setState(() {});
      uploadImage();
    }
  }

  Future getImageFromCamera() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      Navigator.pop(context);
      setState(() {});
      uploadImage();
    }
  }

  Future<void> uploadImage() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var email = prefs.getString('userEmail');
      print(email);
      var uri = Uri.parse(APIPath.PROFILE_PIC_UPLOAD);
      var length = await image!.length();
      var request = http.MultipartRequest('POST', uri)
        ..fields['email'] = '$email'
        ..files.add(await http.MultipartFile.fromPath('image', image!.path,
            contentType: MediaType('application', 'jpg')));
      var response = await request.send();
      var responseData = await http.Response.fromStream(response);
      var decodeResponseData = json.decode(responseData.body.toString());
      var imageLink = decodeResponseData['result']['image'];
      print(decodeResponseData['result']['image']);
      prefs.setString('userImage', imageLink);
      response.stream.transform(utf8.decoder).listen((value) {});
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    setState(() {});
    dateinput.text = "";
    age = 0;

    super.initState();
  }

  calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      setState(() {
        age--;
        date = age.toString();
      });
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.BACKGROUND_COLOR,
        appBar: Custom_Appbar(
            actionButtonText: Strings.SKIP,
            backPressed: () {
              backFromPreviousScreen(context: context);
            },
            skipButtonPressed: () {
              // doNavigate(route: FoodAndLifeStyleWelcome(), context: context);
              doNavigate(route: EditprofilePage2(), context: context);
            }),
        body: ListView(
          children: [
            Container(
              padding: Margins.PAGE_CONTENT_MARGINS,
              height: MediaQuery.of(context).size.height * 0.77,
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 10,
                        child: ClipRRect(
                          borderRadius: Raddi.textFieldBorderRadius,
                          child: LinearProgressIndicator(
                            value: 0.30,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.PROGRESS_YELLOW_LINE),
                            backgroundColor: AppColors.PROGRESS_YELLOWLINE_BG_COLOR,
                          ),
                        ),
                      ),
                      verticalGap(context: context, screenSize: 0.05),
                      getText(
                        text: "Tell us a bit about \nyourself",
                        textStyle: BaseStyles.textStyleForSilderScreenw500,
                      ),
                      verticalGap(context: context, screenSize: 0.02),
                      EditField(
                        readOnly: false,
                        labelText: 'So we know what to call you',
                        infoText: 'First Name',
                        suffixicon: IconButton(
                          icon: const Icon(null),
                          onPressed: () {},
                        ),
                        controller: firstName,
                        keyboardType: TextInputType.name,
                      ),
                      verticalGap(context: context, screenSize: 0.02),
                      EditField(
                        readOnly: false,
                        labelText: 'So we know what to call you',
                        infoText: 'Last Name',
                        suffixicon: IconButton(
                          icon: const Icon(null),
                          onPressed: () {},
                        ),
                        controller: secondName,
                        keyboardType: TextInputType.name,
                      ),
                      verticalGap(context: context, screenSize: 0.02),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  padding: EdgeInsets.all(20),
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      getText(
                                          text: "Profile photo",
                                          textStyle: BaseStyles.profileSubtitle
                                              .copyWith(
                                                  fontSize: 30,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                      verticalGap(
                                          context: context, screenSize: 0.04),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          BottomSheetIcons(
                                              onTap: () {
                                                getImageFromCamera();
                                                print("Camera press");
                                              },
                                              iconData: Icons.camera_alt,
                                              lableText: "Camera"),
                                          BottomSheetIcons(
                                              onTap: () {
                                                getImageFromGallery();
                                                print("Gallery press");
                                              },
                                              iconData: Icons.collections_sharp,
                                              lableText: "Gallery"),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                        child: ListTile(
                          leading: image != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.file(
                                    File(image!.path),
                                    width: 55,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 30,
                                  backgroundColor:  AppColors.textColor,
                                ),
                          title: Text("Upload a \nProfile Picture",
                              textAlign: TextAlign.start, style: infoStyle),
                        ),
                      ),
                      verticalGap(context: context, screenSize: 0.02),
                      ListTile(
                        contentPadding:
                            const EdgeInsets.only(left: 0.0, right: 0.0),
                        textColor: Colors.amber,
                        isThreeLine: true,
                        dense: true,
                        title: getText(
                          text: "Gender",
                          textStyle: profilefieldtextStyle,
                        ),
                        subtitle: DropdownButtonFormField<String>(
                          dropdownColor: Colors.black,
                          icon: const Icon(
                            Icons.expand_more_rounded,
                            color: AppColors.subTextColor,
                          ),
                          iconSize: 40,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.profileDividerClr)),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.profileDividerClr),
                            ),
                            // isDense: true,
                            labelText: 'So we can cater to you better',
                            labelStyle: labletextStyle,
                            // contentPadding:
                            //     EdgeInsets.symmetric(vertical: 9),
                          ),
                          value: _value,
                          items: _items.map((value) {
                            return DropdownMenuItem<String>(
                                child: getText(
                                  text: value,
                                  textStyle: inputtexttextStyle,
                                ),
                                value: value);
                          }).toList(),
                          onChanged: _onDropDownChanged,
                        ),
                      ),
                      verticalGap(context: context, screenSize: 0.02),
                      EditField(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(
                                  1800), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime.now());
                          if (pickedDate != null) {
                            //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);

                            int pickedYear = int.parse(
                                DateFormat('yyyy').format(DateTime.now()));
                            int birthYear = int.parse(
                                DateFormat('yyyy').format(pickedDate));
                            setState(() {
                              age = (pickedYear - birthYear);
                              print(age);
                            });

                            setState(() {
                              dateinput.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                        readOnly: true,
                        controller: dateinput,
                        labelText: 'So we can wish you on your birthday',
                        infoText: 'Date of Birth',
                        suffixicon: IconButton(
                          icon: const Icon(
                            Icons.calendar_today_rounded,
                            color: AppColors.textColor,
                            size: 30,
                          ),
                          onPressed: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(
                                    1800), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime.now());
                            if (pickedDate != null) {
                              //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);

                              int pickedYear = int.parse(
                                  DateFormat('yyyy').format(DateTime.now()));
                              int birthYear = int.parse(
                                  DateFormat('yyyy').format(pickedDate));
                              setState(() {
                                age = (pickedYear - birthYear);
                                print(age);
                              });

                              setState(() {
                                dateinput.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      verticalGap(context: context, screenSize: 0.04),
                    ]),
              ),
            ),
            Padding(
              padding: Margins.PAGE_CONTENT_MARGINS,
              child: CustomButton(
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    var name = prefs.setString(
                        "userName", firstName.text + " ${secondName.text}");
                    // var first_name = prefs.setString(
                    //     'first_name', firstName.text.toString());
                    // var last_name = prefs.setString(
                    //     'last_name', secondName.text.toString());
                    var gender =
                        prefs.setString("userGender", _value.toString());
                    var userAge = prefs.setInt("userAge", age);
                    var dateOfBirh =
                        prefs.setString('userDateOfBirth', dateinput.text);

                    if (firstName.text.isNotEmpty &&
                        secondName.text.isNotEmpty &&
                        dateinput.text.isNotEmpty) {
                      doNavigate(route: EditprofilePage2(), context: context);
                    } else {
                      Fluttertoast.showToast(
                          fontSize: 18,
                          gravity: ToastGravity.TOP,
                          msg: "Name and DOB should not blank!",
                          backgroundColor: ErrorColor.errorColorRed,
                          textColor: AppColors.textColor);
                      print("Not null");
                    }
                  },
                  text: Strings.CONTINUE,
                  borderRadius: Raddi.buttonCornerRadius,
                  buttonColor: AppColors.buttonColor,
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width),
            ),
            verticalGap(context: context, screenSize: 0.02),
          ],
        ));
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
  }

  void _onDropDownChanged(value) {
    setState(() {
      _value = value;
    });
  }

  pickedDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(
            1800), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime.now());
    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      print(formattedDate);

      setState(() {
        dateinput.text = formattedDate; //set output date to TextField value.
      });
    } else {
      print("Date is not selected");
    }
  }
}
