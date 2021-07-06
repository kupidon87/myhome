import '../import.dart';
import 'package:flutter/material.dart';

class MenuInfo extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  final String title;

  const MenuInfo({Key key, this.icon, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.cyan,
              size: 23,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}