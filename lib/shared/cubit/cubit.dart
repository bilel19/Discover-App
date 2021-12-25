
import 'package:bloc/bloc.dart';
import 'package:discover_app/models/places_model.dart';
import 'package:discover_app/modules/charts_screen.dart';
import 'package:discover_app/modules/home_screen.dart';
import 'package:discover_app/modules/profil_screen.dart';
import 'package:discover_app/modules/search_screen.dart';
import 'package:discover_app/shared/cubit/states.dart';
import 'package:discover_app/shared/network/remote/http_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscoverCubit extends Cubit<DiscoverStates>{
  DiscoverCubit({required this.data}) : super(DiscoverInitialState());

  static DiscoverCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;

  List<BottomNavigationBarItem> navItems=[
    BottomNavigationBarItem(title: Text('home'),icon: Icon(Icons.apps)),
    BottomNavigationBarItem(title: Text('charts'),icon: Icon(Icons.bar_chart_sharp)),
    BottomNavigationBarItem(title: Text('search'),icon: Icon(Icons.search)),
    BottomNavigationBarItem(title: Text('profil'),icon: Icon(Icons.person)),
  ];

  List<Widget> screens=[
    HomeScreen(),
    ChartsScreen(),
    SearchScreen(),
    ProfilScreen(),
  ];

  void ChangeBotoomNav(int index){
    currentIndex=index;
    emit(DiscoverChangeNavState());
  }

  int selectedIndex=-1;
  void changeColorSelected(int index){
    selectedIndex=index;
    emit(DiscoverChangeColorSelctedState());
  }


  final HttpHelper data;
  late final places;
  void GetPlaces()async{
    emit(DiscoverGetDataLoadingState());
    places= await data.getData();
    emit(DiscoverGetDataSuccessState(places));
  }
}