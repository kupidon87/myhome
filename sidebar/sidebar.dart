import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../import.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);
  final children = List<Widget>.generate(100, (i) => Text('Item $i')).toList();

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 35, /// ?????????????????? ?????????? ????????????
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: double.maxFinite, //?????? ???? ?????? ????????????????????
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      color: const Color(0xFF262AAA),

                      ///???????? ??????????????????;
                      child: Column(
                        children: <Widget>[

                          ///???????????? ???? ???????????????? ?? ???????????????? ??????????????
                          SizedBox(
                            height: 30,
                          ),

                          ///??????????????, ???????????????? ?? ????????????
                          Container(
                            child: ListTile(
                               title: Text(
                                appNameTitle,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              subtitle: Text(
                                vers + beta,
                                style: TextStyle(
                                  color: Color(0xff1bb5fd),
                                  fontSize: 16,
                                ),
                              ),
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage('images/logo.png'),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          Divider(
                            height: 30,
                            thickness: 0.5,
                            color: Colors.white.withOpacity(0.3),
                            indent: 32,
                            endIndent: 32,
                          ),

                          ///????????
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ///?????? ?????? ???????????? ????????

                                Expanded(
                                  child: Container(),
                                ),

                                ///??????????????
                                MenuItem(
                                  icon: Icons.web,
                                  title: '??????????????',
                                  onTap: () {
                                    onIconPressed();
                                    BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomeViewClickEvents);
                                  },
                                ),

                                Container(
                                  width: 10,
                                ),

                                ///??????????????
                                MenuItem(
                                  icon: Icons.person,
                                  title: '??????????????',
                                  onTap: () {
                                    onIconPressed();
                                    BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.ProfilPageClickEvents);
                                  },
                                ),

                                Container(
                                  width: 10,
                                ),

                                ///????????/??????????????????????
                                MenuItem(
                                  icon: Icons.crop_original,
                                  title: '????????',
                                  onTap: () {
                                    onIconPressed();
//                                    BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.ShopPageClickEvents);
                                  },
                                ),

                                Container(
                                  width: 10,
                                ),

                                ///????????????
                                MenuItem(
                                  icon: Icons.group,
                                  title: '????????????',
                                onTap: () {
                                  onIconPressed();
//                                  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.NewsPageClickEvents);
                                },
                                ),

                                Container(
                                  width: 10,
                                ),

                                ///????????????
                                MenuItem(
                                  icon: Icons.shopping_cart,
                                  title: '????????????????',
                                onTap: () {
                                  onIconPressed();
//                                  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.PhotoCamClickedEvent);
                                },
                                ),

                                Container(
                                  width: 10,
                                ),

                                ///??????????????????????
                                MenuItem(
                                  icon: Icons.location_city,
                                  title: '??????????????????????',
                                onTap: () {
                                  onIconPressed();
//                                  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.PhotoCamClickedEvent);
                                },
                                ),

                                Expanded(
                                  child: Container(),
                                ),
                              ],
                            ),
                          ),

                          Divider(
                            height: 30,
                            thickness: 0.5,
                            color: Colors.white.withOpacity(0.3),
                            indent: 32,
                            endIndent: 32,
                          ),


                          ///???????????????? ????????
//                        Container(
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: <Widget>[
//                              ///?????? ?????? ???????????? ????????
//
//                              MenuItem(
//                                icon: Icons.insert_comment,
//                                title: '??????????????',
//                                onTap: () {
//                                  onIconPressed();
//                                  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.NewsAppClickedEvent);
//                                },
//                              ),
//                            ],
//                          ),
//                        ),

                          ///???????????? ????????

//                        Positioned(
//                          bottom: 32,
//                          left: 16,
//                          child: Text(
//                            '????????????',
//                            style: TextStyle(
//                              color: Colors.white,
//                            ),
//                          ),
//                        ),
                          SizedBox(
                            height: 370,
                          ),

                          Divider(
                            height: 30,
                            thickness: 0.5,
                            color: Colors.white.withOpacity(0.3),
                            indent: 32,
                            endIndent: 32,
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[

                                MenuInfo(
                                  icon: Icons.info,
                                  title: ' ?? ?????? ',
                                  onTap: (){
                                    onIconPressed();
//                                    BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.InfoNewClickedEvent);
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 0),
                                  child: FlatButton.icon(
                                      onPressed: (){
                                        AuthService().logOut();
                                      },
                                      icon: Icon(
                                          Icons.exit_to_app, color: Colors.blue,
                                      ),
                                      label: Text('??????????', style: TextStyle(color: Colors.white))
                                  ),
                                ),
                              ],
                            ),
                          ),


                        ],
                      ),
                      ///?????????? ????????


                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Color(0xFF262AAA),
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Color(0xFF1BB5FD),
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
