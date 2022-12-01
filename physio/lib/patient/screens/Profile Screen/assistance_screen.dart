import 'package:flutter/material.dart';

import '../../../BaseWidget/accounts_card.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/style.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';

class AssistanceScreen extends StatefulWidget {
  const AssistanceScreen({Key? key}) : super(key: key);

  @override
  State<AssistanceScreen> createState() => _AssistanceScreenState();
}

class _AssistanceScreenState extends State<AssistanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 80,
        backgroundColor: AppColors.BACKGROUND_COLOR,
        leading: getBackIconButton(context: context),
        title: getText(text: "Accounts", textStyle: BaseStyles.appBarTextStyle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Margins.PAGE_CONTENT_MARGINS,
          child: Column(
            children: [
              AccountsCard(
                iconData: Icons.payment,
                titleText: "Online help",
                child: Icon(
                  Icons.expand_less,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              AccountsCard(
                iconData: Icons.payment,
                titleText: "Support number",
                child: Icon(
                  Icons.expand_less,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              AccountsCard(
                iconData: Icons.payment,
                titleText: "Chat",
                child: Icon(
                  Icons.expand_less,
                  color: Colors.white,
                  size: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
