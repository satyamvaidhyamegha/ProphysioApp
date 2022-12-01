import 'package:flutter/material.dart';
import 'package:physio/patient/screens/Routine/routinee_steep_female_details.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../BaseWidget/base_image_widget.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/navigation.dart';

class RoutineStepMale extends StatefulWidget {
  const RoutineStepMale({Key? key}) : super(key: key);

  @override
  State<RoutineStepMale> createState() => _RoutineStepMaleState();
}

class _RoutineStepMaleState extends State<RoutineStepMale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: getAssetImage(
                        imagePath: ImagePath.ROUTINE_UP_NEXT_IMAGE,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        //padding: Margins.PAGE_CONTENT_MARGINS,
                        color: Colors.transparent.withOpacity(0.3),
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: ListTile(
                          leading: getBackIconButton(context: context),
                          title: getText(
                              text: "Routine - 1",
                              textStyle: profilefieldtextStyle),
                          trailing: IconButton(
                              onPressed: () {
                                doNavigate(route: RoutineFemaleDetails(), context: context);
                              },
                              icon: Icon(
                                Icons.cancel_presentation,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      
                    ],
                  )),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width,
              color: AppColors.allDoctorBackGroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 getTwoButtonSplit(
                      context: context, buttonText: "I’m Done", onPress: () {}),
                  getTwoButtonSplit(
                      context: context, buttonText: "Restart", onPress: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
