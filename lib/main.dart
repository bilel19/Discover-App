import 'package:discover_app/layout/discover_layout.dart';
import 'package:discover_app/modules/boarding_screen.dart';
import 'package:discover_app/modules/details_page.dart';
import 'package:discover_app/shared/cubit/cubit.dart';
import 'package:discover_app/shared/cubit/states.dart';
import 'package:discover_app/shared/network/remote/http_helper.dart';
import 'package:discover_app/shared/observer.dart';
import 'package:discover_app/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {

  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>DiscoverCubit(data: HttpHelper())..GetPlaces(),
      child: BlocConsumer<DiscoverCubit,DiscoverStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lighttheme,
            home: BoardingScreen(),
          );
        },
      ),
    );
  }
}

