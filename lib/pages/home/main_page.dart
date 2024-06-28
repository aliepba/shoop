// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoop/pages/home/chat_page.dart';
import 'package:shoop/pages/home/history_page.dart';
import 'package:shoop/pages/home/home_page.dart';
import 'package:shoop/pages/home/profile_page.dart';
import 'package:shoop/pages/home/wishlist_page.dart';
import 'package:shoop/providers/page_provider.dart';
import 'package:shoop/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        backgroundColor: primaryColor,
        child: Image.asset(
          'assets/ic_cart.png',
          width: 20,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomNavigationBar(
            backgroundColor: backgroundColor4,
            type: BottomNavigationBarType.fixed,
            currentIndex: pageProvider.currentIndex,
            onTap: (value) {
              pageProvider.currentIndex = value;
            },
            selectedItemColor: primaryColor,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Image.asset(
                      'assets/ic_home_off.png',
                      width: 21,
                      color: pageProvider.currentIndex == 0
                          ? primaryColor
                          : secondaryColor,
                    ),
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Image.asset(
                      'assets/ic_chat_off.png',
                      width: 20,
                      color: pageProvider.currentIndex == 1
                          ? primaryColor
                          : secondaryColor,
                    ),
                  ),
                  label: 'Chat'),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Image.asset(
                      'assets/ic_favorite_off.png',
                      width: 20,
                      color: pageProvider.currentIndex == 2
                          ? primaryColor
                          : secondaryColor,
                    ),
                  ),
                  label: 'Wishlist'),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Image.asset(
                    'assets/ic_profile_off.png',
                    width: 20,
                    color: pageProvider.currentIndex == 3
                        ? primaryColor
                        : secondaryColor,
                  ),
                ),
                label: 'User',
              ),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Icon(
                      Icons.document_scanner,
                      color: pageProvider.currentIndex == 4
                          ? primaryColor
                          : secondaryColor,
                    ),
                  ),
                  label: 'Tansaction'),
            ]),
      );
    }

    Widget body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return ChatPage();
          break;
        case 2:
          return WishlistPage();
          break;
        case 3:
          return ProfilePage();
          break;
        case 4:
          return HistoryPage();
          break;
        default:
          return HomePage();
      }
    }

    return Scaffold(
      // backgroundColor: backgroundColor2,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
