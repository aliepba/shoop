// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:shoop/models/message_model.dart';
import 'package:shoop/models/product_model.dart';
import 'package:shoop/pages/detail_chat.dart';
import 'package:shoop/theme.dart';

class ChatList extends StatelessWidget {
  final MessageModel message;
  ChatList(this.message);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailChatPage(
                      UninitalizedProductModel(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(top: 33),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/ic_shop.png',
                  width: 54,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saburo Store',
                        style: primaryTextStyle.copyWith(
                            fontSize: 15, fontWeight: bold),
                      ),
                      Text(
                        message.message,
                        style: blackTextStyle.copyWith(fontWeight: light),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Text(
                  'Now',
                  style: secondaryTextStyle.copyWith(fontSize: 10),
                )
              ],
            ),
            SizedBox(height: 12),
            Divider(
              thickness: 1,
              color: Color(0xff2B2939),
            )
          ],
        ),
      ),
    );
  }
}
