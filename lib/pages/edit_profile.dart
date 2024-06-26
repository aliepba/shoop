import 'package:flutter/material.dart';
import 'package:shoop/theme.dart';
import 'package:shoop/models/user_model.dart';
import 'package:shoop/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    PreferredSizeWidget header() {
      return AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: thirdTextStyle,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.check,
                color: primaryColor,
              ))
        ],
      );
    }

    Widget nameInput(String text, String title) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 13),
          ),
          TextFormField(
            style: primaryTextStyle,
            decoration: InputDecoration(
                hintText: text,
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: subtitleColor))),
          )
        ]),
      );
    }

    Widget content() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(top: defaultMargin),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/img_profile.png'))),
            ),
            nameInput('${user.name}', 'Name'),
            nameInput('${user.phone}', 'Phone'),
            nameInput('${user.email}', 'Email')
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor0,
      appBar: header(),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
