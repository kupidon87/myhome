import 'dart:async';
import 'package:provider/provider.dart';
import 'import.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());}

// Основной виджет приложения
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}



  class _MyAppState extends State<MyApp>{
  StreamSubscription<User> userStreamSubscription;
  Stream<User> userDataStream;
  StreamSubscription<User> setUserDataStream() {
    final auth = AuthService();
    return auth.currentUser.listen((user){
      userDataStream = auth.getCurrentUserWithData(user);
      setState(() {

      });
    });
  }
  @override
  void initState() {
    super.initState();
    userStreamSubscription = setUserDataStream();
  }

  @override
  void dispose() {
    super.dispose();
    userStreamSubscription.cancel();
  }
  // Формируем маршрутизацию приложения
  final routes = <String, WidgetBuilder>{
    // Путь, по которому создаётся Home Screen
    ///LoginView -авторизация
    ///SignUpView -регистрация
    ///StartUpView -профиль
    '/Home': (BuildContext context) => LadingPage(),
  };

  // Необходимо переопределить метод строительства инстанса виджета
  @override
  Widget build(BuildContext context) {

    return StreamProvider<User>.value(
      value: userDataStream,
//      value: AuthService().currentUser,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
//        builder: (context, child) => Navigator(
//          key: locator<DialogService>().dialogNavigationKey,
//          onGenerateRoute: (settings) => MaterialPageRoute(
//              builder: (context) => DialogManager(child: child)),
//        ),
//        navigatorKey: locator<NavigationService>().navigationKey,
//        navigatorObservers: [locator<AnalyticsService>().getAnalyticsObserver()],
          // в котором будет Splash Screen с указанием следующего маршрута
          home: SplashScreen(nextRoute: '/Home'),
//        onGenerateRoute: generateRoute,
          // передаём маршруты в приложение
          routes: routes,
      ),
    );
  }
}