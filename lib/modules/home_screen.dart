import 'package:discover_app/misc/colors.dart';
import 'package:discover_app/modules/details_page.dart';
import 'package:discover_app/shared/components/components.dart';
import 'package:discover_app/shared/cubit/cubit.dart';
import 'package:discover_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class hobbyModel{
  String? img;
  String? name;

  hobbyModel({
    required this.img,
    required this.name,
  });
}


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List<hobbyModel> hobbies=[
    hobbyModel(img: 'assets/images/kayaking.png', name: 'kayakin'),
    hobbyModel(img: 'assets/images/balloning.png', name: 'balloning'),
    hobbyModel(img: 'assets/images/hiking.png', name: 'hiking'),
    hobbyModel(img: 'assets/images/snorkling.png', name: 'snorkling'),
  ];
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return BlocConsumer<DiscoverCubit,DiscoverStates>(
       listener: (context,state){},
      builder: (context,state){
        var cubit=DiscoverCubit.get(context);
        if(cubit.places != null) {
          return Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.menu_sharp),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    margin: EdgeInsets.all(8),
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/images/ggg.jpg'),
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Discover',
                      style: TextStyle(
                          fontSize: 27, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: TabBar(
                        controller: tabController,
                        labelPadding: EdgeInsets.only(right: 10, left: 10),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
                        tabs: [
                          Tab(
                            child: Text('Places'),
                          ),
                          Tab(
                            child: Text('Inspiration'),
                          ),
                          Tab(
                            child: Text('Emotions'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,),
                    Container(
                      height: 300,
                      width: double.maxFinite,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          ListView.separated(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  NavigateTo(context, DetailsPageScreen(placesModel: cubit.places[index],));
                                },
                                child: Container(
                                  height: 250,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage('http://mark.bslmeiyu.com/uploads/'+cubit.places[index].img!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context,
                                int index) {
                              return SizedBox(
                                width: 10,
                              );
                            },
                            itemCount: cubit.places.length,
                          ),
                          Text('there'),
                          Text('bye'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Explore more',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Text(
                            'See all',
                            style: TextStyle(fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.mainColor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,),
                    Container(
                      height: 90,
                      width: double.maxFinite,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        '${hobbies[index].img}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 70,
                                child: Center(
                                  child: Text(
                                    '${hobbies[index].name}',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .caption,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 10,
                          );
                        },
                        itemCount: hobbies.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        else
          return Container(
            color: Colors.white,
            child: Center(child: CircularProgressIndicator()),
          );
      },
    );
  }
}
