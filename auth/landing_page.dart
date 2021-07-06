import 'package:provider/provider.dart';

import '../import.dart';
import 'package:flutter/material.dart';

class LadingPage extends StatelessWidget{
  const LadingPage({Key key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    final bool isLoggedIn = user != null; /// меняем на true - правда false - ложь

    return isLoggedIn ? SideBarLayout() : LoginView();
  }

}