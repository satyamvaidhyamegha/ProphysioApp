import 'package:flutter/material.dart';

import '../../../BaseWidget/accounts_card.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/style.dart';
import '../../../BaseWidget/text.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(34, 34, 34, 1),
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 80,
        backgroundColor: Color.fromRGBO(34, 34, 34, 1),
        leading: getBackIconButton(context: context),
        title: getText(text: "Accounts", textStyle: BaseStyles.appBarTextStyle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              AccountsCard(
                iconData: Icons.payment,
                titleText: "Payment info",
                child: const Icon(
                  Icons.expand_less,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              AccountsCard(
                iconData: Icons.payment,
                titleText: "Save Cards",
                child: const Icon(
                  Icons.expand_less,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              AccountsCard(
                iconData: Icons.payment,
                titleText: "Subscription",
                child: const Icon(
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
