
import 'package:discover_app/shared/cubit/cubit.dart';
import 'package:discover_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit=DiscoverCubit.get(context);
    return BlocConsumer<DiscoverCubit,DiscoverStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.ChangeBotoomNav(index);
            },
            items: cubit.navItems,
          ),
        );
      },
    );
  }
}