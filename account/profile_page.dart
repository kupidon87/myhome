import 'package:buttons_tabbar/buttons_tabbar.dart';

import '../import.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget with NavigationStates{


  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with NavigationStates{

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: <Widget>[

///верх пользователя
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: size.height * 0.30, //высота логотипа и профеля.
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/fon.png'),
                      fit: BoxFit.cover,
                    ),

                  ),
                  child: Column(
                    children: <Widget>[

                      Container(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 40, top: 30),
                              child: CircleAvatar(
                                radius: 36,
                                backgroundImage: AssetImage('images/logo.png'),
                              ),
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(left: 10, top: 30),
                                      child: Text(
                                        '123123',//'${User.fromData(dataDecode(result.fullName))}',//user.fullName, ///тут будет имя
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Column(
                                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child:  ///информация о пользователе
                                          GestureDetector(
                                              child: Text(pinfo,
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.push(context, PageRouteBuilder(
                                                  opaque: false,
//                                                  pageBuilder: (BuildContext context, _, __) => PInfo(),
                                                ),
                                                );
                                              }
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),



                              ],
                            ),




                          ],
                        ),
                      ),

                      ///пустое пространство для отстыпов
                      Expanded(
                        child: Container(),
                      ),

                      ///Выводим количество друзей фото и видео
                      Container(
                        height: 64,
                        color: Colors.black.withOpacity(0.4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[


                            Expanded(
                              child: Container(),
                            ),

                            Container(
                              width: 140,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[

                                  Text(
                                    'Друзья',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                    ),
                                  ),


                                  SizedBox(
                                    height: 4,
                                  ),

                                  Text(
                                    '??',//'${user.getFriends()}', //Количество
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              width: 110,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[

                                  Text(
                                    photo,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                    ),
                                  ),

                                  SizedBox(
                                    height: 4,
                                  ),

                                  Text(
                                    '??', //Количество
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),


                                ],
                              ),
                            ),

                            Container(
                              width: 110,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[

                                  Text(
                                    video,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                    ),
                                  ),

                                  SizedBox(
                                    height: 4,
                                  ),

                                  Text(
                                    '??', //Количество
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),


                                ],
                              ),
                            ),


                            Expanded(
                              child: Container(),
                            ),

                            Divider(
                              color: Colors.grey[400],
                            ),

                            ///выход


                          ],
                        ),
                      ),




                    ],
                  ),
                ),
              ],
          ),

          Material(
            elevation: 1,
            child: Container(
              height: 455.4,
              child: DefaultTabController(
                length: 5, //количество Tab-ов
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ButtonsTabBar(
                        tabs: [
                          Tab(icon: Icon(Icons.web),),
                          Tab(icon: Icon(Icons.person),),
                          Tab(icon: Icon(Icons.image)),
                          Tab(icon: Icon(Icons.play_circle_outline)),
                          Tab(icon: Icon(Icons.settings))
                        ]),

                    Divider(
                      thickness: 0.9,
                      color: Colors.black.withOpacity(0.3),
                      indent: 32,
                      endIndent: 32,
                    ),


                    Expanded(
                      child:Container(
                        child: TabBarView(
                          children: <Widget>[

                            Container(child: Text('')),//LifeNews()),

                            Container(child: Text('1')),//LifeNews()),

                            Container(child: Text('1')),//LifeNews()),

                            Container(child: Text('1')),//LifeNews()),

                            Container(child: Text('1')),//LifeNews()),
                          ],
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}