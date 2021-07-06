import 'package:buttons_tabbar/buttons_tabbar.dart';
import '../import.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget with NavigationStates{

  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Material(
//              elevation: 1,
              child: Container(
                height: 655.4,
                child: DefaultTabController(
                  length: 1, //количество Tab-ов
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 160, top: 20),///тут будет скрол left: 37 как должно быть но пока делаем по цетру
                          child: ButtonsTabBar(
                              tabs: [
                                Tab(text: 'LifeNews'),
//                            Tab(text: 'WorldNews'),
//                            Tab(icon: Icon(Icons.image)),
//                            Tab(icon: Icon(Icons.play_circle_outline)),
//                            Tab(icon: Icon(Icons.settings))
                              ]),
                      ),


                     Expanded(
                          child:Container(
                            child: TabBarView(
                              children: <Widget>[

                                Padding(
                                  padding: const EdgeInsets.only(top: 45, left: 5, right: 5),
                                  child: Container(child: Text('234234')),
                                ),//LifeNews()),

//                              Container(child: Text('1')),//LifeNews()),

//                              Container(child: Text('1')),//LifeNews()),
//
//                              Container(child: Text('1')),//LifeNews()),
//
//                              Container(child: Text('1')),//LifeNews()),
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