import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../constants/colors.dart';
import '../constants/text_constants.dart';

class StepProgressIndicate extends StatefulWidget {
  const StepProgressIndicate({Key? key}) : super(key: key);

  @override
  State<StepProgressIndicate> createState() => _StepProgressIndicateState();
}

class _StepProgressIndicateState extends State<StepProgressIndicate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircularStepProgressIndicator(
          circularDirection: CircularDirection.counterclockwise,
          child: Center(
            child: getText(
                text: "3/5",
                textStyle: profilefieldtextStyle.copyWith(
                    fontSize: 21, color: AppColors.ROUTINE_STEP_COLOR)),
          ),
          totalSteps: 100,
          currentStep: 74,
          stepSize: 5,
          selectedColor: AppColors.ROUTINE_STEP_COLOR,
          unselectedColor: Colors.black,
          padding: 0,
          width: 110,
          height: 110,
          selectedStepSize: 5,
          roundedCap: (_, __) => true,
        ),
        getText(text: " Exercises\nCompleted", textStyle: profilefieldtextStyle)
      ],
    );
  }
}
