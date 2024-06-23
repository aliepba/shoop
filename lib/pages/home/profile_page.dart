import 'package:flutter/material.dart';
import 'package:shoop/models/user_model.dart';
import 'package:shoop/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:shoop/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(defaultMargin),
            child: Row(children: [
              ClipOval(
                child: Image.asset(
                  'assets/img_profile.png',
                  width: 64,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ${user.name}',
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                  ),
                  Text(
                    '${user.email}',
                    style: subtitleTextStyle.copyWith(fontSize: 16),
                  )
                ],
              )),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/sign-in', (route) => false);
                },
                child: Image.asset(
                  'assets/btn_exit.png',
                  width: 24,
                ),
              )
            ]),
          ),
        ),
      );
    }

    Widget menuItem(String text, String route) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Container(
          margin: EdgeInsets.only(top: 16),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(text, style: blackTextStyle.copyWith(fontSize: 13)),
            Icon(
              Icons.chevron_right,
              color: primaryColor,
            )
          ]),
        ),
      );
    }

    Widget content() {
      return Expanded(
          child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 20,
          ),
          Text('Account',
              style: primaryTextStyle.copyWith(
                  fontSize: 16, fontWeight: semiBold)),
          menuItem('Edit Profile', '/edit-profile'),
          menuItem('Your Orders', '/transaction-history'),
          menuItem('Help Center', '/edit-profile'),
          SizedBox(
            height: 30,
          ),
          Text('General',
              style: primaryTextStyle.copyWith(
                  fontSize: 16, fontWeight: semiBold)),
          menuItem('Privacy & Policy', '/edit-profile'),
          menuItem('Term of Service', '/edit-profile'),
          menuItem('Rate App', '/edit-profile'),
        ]),
      ));
    }

    return Column(
      children: [header(), content()],
    );
  }
}
