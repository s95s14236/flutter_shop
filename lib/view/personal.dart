import 'package:flutter/material.dart';

class PersonalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('Steven Wang'),
          accountEmail: Text('s95s14236@gmail.com'),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('帳號設定'),
          trailing: Icon(Icons.keyboard_arrow_right),
          // TODO: 帳號設定
          onTap: () {},
        ),
      ],
    );
  }
}
