import 'package:flutter/material.dart';

class CustomTextAppBar extends StatefulWidget implements PreferredSizeWidget{
  
  final String titletext;

  const CustomTextAppBar({Key key, this.titletext}) : super(key: key);

  
  @override
  _CustomTextAppBarState createState() => _CustomTextAppBarState();
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);

}

class _CustomTextAppBarState extends State<CustomTextAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0.0,
        title: Text(widget.titletext),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            // TODO: search function
            onPressed: () {
              print('search');
            },
          ),
        ],
      );
  }
}