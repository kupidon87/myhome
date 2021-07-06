import 'package:flutter/material.dart';

//import '../import.dart';

class MenuItem extends StatelessWidget{
  final IconData icon;
  final Function onTap;
  final String title;

  const MenuItem ({
    Key key,
    this.icon,
    this.onTap,
    this.title
  }) :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          children: <Widget>[
            Icon(icon, color: Colors.grey[500], size: 35,),
            Text(
              title,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.grey[400]),
            )
          ],
        ),
      ),
    );
  }
}