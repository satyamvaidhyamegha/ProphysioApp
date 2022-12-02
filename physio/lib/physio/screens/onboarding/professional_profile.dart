import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import 'package:physio/constants/string.dart';
import 'package:physio/physio/database/model/onboardingDetailsModel.dart';
import 'package:physio/physio/screens/onboarding/auth_screen3.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:physio/physio/screens/onboarding/certification_screen.dart';
import 'package:physio/physio/screens/onboarding/signup_screen2.dart';
import 'package:physio/physio/screens/onboarding/about_you_screen.dart';
import '../../../BaseWidget/style.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/text_constants.dart';
import '../../viewmodel/onboard_view_model.dart';

class ProfessionalProfile extends StatefulWidget {
  String? firstName;
  String? lastName;
  String? emailId;
  String? pass;



  ProfessionalProfile(
      {required this.firstName,
      required this.lastName,
      required this.emailId,
      required this.pass});

  @override
  _ProfessionalProfilePageState createState() =>
      _ProfessionalProfilePageState(firstName, lastName, emailId, pass);
}

class _ProfessionalProfilePageState extends State<ProfessionalProfile> {
  var windowWidth;
  var windowHeight;

  final viewModel = Get.put(OnboardViewModel());
  File? imgFile;

  String? firstName;
  String? lastName;
  String? emailId;
  String? pass;

  _ProfessionalProfilePageState(
      this.firstName, this.lastName, this.emailId, this.pass);

  String dropdownCurrency = 'Rupees';
  List<String> itemsCurrency = [
    'Rupees',
    'Dollar',
    'Taka',
    'Euros',
    'Pesos',
    'Pound',
    'Dinar',
    'Franc',
    'Yen',
    'Sol',
  ];

  final TextEditingController addressController = TextEditingController();
  final TextEditingController contactNoController = TextEditingController();
  final TextEditingController rateController = TextEditingController();

  String address = "";
  String contactNo = "";
  String rate = "";
  String yoe = "69";
  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: initScreen(context),
    );
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: AppColors.signupBackground,
      ),
      body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: AppColors.signupBackground,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20, left: 20, top: 10),
                    child: LinearPercentIndicator(
                      percent: 0.4,
                      animation: true,
                      animationDuration: 1000,
                      lineHeight: 10,
                      progressColor: Colors.amber,
                      barRadius: const Radius.circular(16),
                      backgroundColor: const Color(0xff707070),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                        right: 20, left: 20, bottom: 10, top: 30),
                    child: getText(
                        textAlign: TextAlign.left,
                        text: "Professional\nProfile",
                        textStyle: signupText),
                  ),
                  Row(children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(
                            right: 0, left: 20, bottom: 5, top: 20),
                        child: getText(
                            textAlign: TextAlign.start,
                            text: "Work/Clinic Details",
                            textStyle: professionProfileHeading1),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.only(
                              top: 20, right: 30, bottom: 5, left: 40),
                          child: const Divider(
                            thickness: 1,
                            color: Colors.white,
                          )),
                    ),
                  ]),
                  Container(
                    height: 100,
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.blueGrey, width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: addressController,
                      decoration: InputDecoration(
                          labelText: "Address",
                          labelStyle: headertext,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[300]),
                          fillColor: Colors.black),
                      maxLines: 5,
                      onChanged: (String addresss) {
                        addresss = addressController.text;
                        address = addresss;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.blueGrey, width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: contactNoController,
                      decoration: InputDecoration(
                          labelText: "Enter Contact no.",
                          labelStyle: headertext,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[300]),
                          fillColor: Colors.black),
                      onChanged: (String mobile) {
                        mobile = contactNoController.text;
                        contactNo = mobile;
                      },
                    ),
                  ),
                  Row(children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(
                            right: 10, left: 20, bottom: 5, top: 20),
                        child: getText(
                            textAlign: TextAlign.center,
                            text: "Payment Details",
                            textStyle: professionProfileHeading1),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.only(
                              top: 20, right: 30, bottom: 5, left: 40),
                          child: const Divider(
                            thickness: 1,
                            color: Colors.white,
                          )),
                    ),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 30, left: 20, right: 20),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              border:
                                  Border.all(color: Colors.blueGrey, width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: rateController,
                            decoration: InputDecoration(
                                labelText: "Charges per hour",
                                labelStyle: headertext,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[300]),
                                fillColor: Colors.black),
                            onChanged: (String charges) {
                              charges = rateController.text;
                              rate = charges;
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                            height: 50,
                            margin: const EdgeInsets.only(
                                top: 30, left: 20, right: 20),
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 150,
                              height: MediaQuery.of(context).size.height * 0.07,
                              alignment: Alignment.centerLeft,
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(
                                      color: Colors.blueGrey, width: 1),
                                  borderRadius: BorderRadius.circular(15)),
                              child: DropdownButton(
                                // Initial Value
                                value: dropdownCurrency,
                                underline: const SizedBox(),
                                focusColor: Colors.white,
                                dropdownColor: AppColors.signupBackground,
                                style: BaseStyles.textStyleForSignupScreen,
                                iconEnabledColor: Colors.white,

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: itemsCurrency.map((String itemsCurr) {
                                  return DropdownMenuItem(
                                    value: itemsCurr,
                                    child: Text(itemsCurr),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownCurrency = newValue!;
                                  });
                                },
                              ),
                            )),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    alignment: Alignment.bottomCenter,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.buttonColor),
                    child: GestureDetector(
                      onTap: () {

                        debugPrint("Tap Ho Rha hai");
                        debugPrint(viewModel.allOnboardDetails[0].physioimg);

                        uploadImg();

                        // SignupService.signup(
                        //         viewModel.allOnboardDetails[0].firstName,
                        //         viewModel.allOnboardDetails[0].lastName,
                        //         address,
                        //         int.parse(rate),
                        //         int.parse(yoe),
                        //         "+91${viewModel.allOnboardDetails[0].mobileNo}",
                        //         viewModel.allOnboardDetails[0].email,
                        //         viewModel.allOnboardDetails[0].password,
                        //         viewModel.allOnboardDetails[0].physioimg,
                        // )
                        //     .then((response) async {
                        //   debugPrint("Api hit done");
                        //   debugPrint(response.id);
                        //   if (response.id != null) {
                        //     Navigator.pushReplacement(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => AboutYouScreen()));
                        //   }
                        //
                        // });

                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => AboutYouScreen()));
                      },
                      child: Center(
                        child: getText(
                            textAlign: TextAlign.center,
                            text: "About You",
                            textStyle: buttonTextStyle),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Future<void> uploadImg() async{

    String path = viewModel.allOnboardDetails[0].physioimg;
    debugPrint("debzpath $path");
    imgFile = File(path);

    var stream = new http.ByteStream(imgFile!.openRead());
    stream.cast();

    var uri = Uri.parse('https://api.prophysio.in/mobile/physios/signup');

    var req = new http.MultipartRequest("POST", uri);

    req.fields['firstname'] = viewModel.allOnboardDetails[0].firstName;
    req.fields['secondname'] = viewModel.allOnboardDetails[0].lastName;
    req.fields['address'] = address;
    req.fields['rate'] = rate;
    req.fields['yearOfExperience'] = yoe;
    req.fields['phone'] = viewModel.allOnboardDetails[0].mobileNo;
    req.fields['email'] = viewModel.allOnboardDetails[0].email;
    req.fields['password'] = viewModel.allOnboardDetails[0].password;

    http.MultipartFile imageFile = await http.MultipartFile.fromPath('physioimg', path, contentType: new MediaType('image', 'jpg'));

    req.files.add(imageFile);

    var response = await req.send();
    response.stream.transform(utf8.decoder).listen((value) {

      var results = jsonDecode(value);
      int physioId = results['result']['id'];
      viewModel.updateDetails(OnboardDetailsModel(id: viewModel.allOnboardDetails[0].id, firstName: viewModel.allOnboardDetails[0].firstName, lastName: viewModel.allOnboardDetails[0].lastName, mobileNo: viewModel.allOnboardDetails[0].mobileNo, email: viewModel.allOnboardDetails[0].email, password: viewModel.allOnboardDetails[0].password, physioimg: viewModel.allOnboardDetails[0].physioimg, physioId: physioId));
    });


    if(response.statusCode == 200){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => AboutYouScreen()));
      debugPrint('Uploaded');
    } else {
      debugPrint('Not Uploaded');
    }
  }
}
