import 'package:bloc/bloc.dart';


import '../import.dart';


enum NavigationEvents{
  HomeViewClickEvents,
  ProfilPageClickEvents,
//  ShopPageClickEvents,
//  NewsPageClickEvents,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => HomeView();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomeViewClickEvents:
        yield HomeView();
        break;
      case NavigationEvents.ProfilPageClickEvents:
        yield ProfilePage();
        break;
//        case NavigationEvents.ShopPageClickEvents:
//        yield ShopPage();
//        break;
//      case NavigationEvents.NewsPageClickEvents:
//        yield NewsApp();
//        break;
    }
  }
}