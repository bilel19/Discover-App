import 'package:discover_app/misc/colors.dart';
import 'package:discover_app/models/places_model.dart';
import 'package:discover_app/shared/components/components.dart';
import 'package:discover_app/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readmore/readmore.dart';

class DetailsPageScreen extends StatefulWidget {
  PlacesModel? placesModel;
  DetailsPageScreen({required this.placesModel});

  @override
  _DetailsPageScreenState createState() => _DetailsPageScreenState();
}

class _DetailsPageScreenState extends State<DetailsPageScreen> {
  @override
  Widget build(BuildContext context) {
    int? starsCount = widget.placesModel!.stars;

    var cubit=DiscoverCubit.get(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('http://mark.bslmeiyu.com/uploads/'+widget.placesModel!.img!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 8, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_vert),
                      color: Colors.white),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.35,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 10, top: 20),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35),
                    topLeft: Radius.circular(35),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.placesModel!.name}',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Text(
                            '\$ ${widget.placesModel!.price}',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: AppColors.mainColor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 18,
                          color: AppColors.mainColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${widget.placesModel!.location}',
                          style: TextStyle(color: AppColors.mainColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < starsCount!
                                  ? AppColors.starColor
                                  : AppColors.textColor2,
                            );
                          }),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '($starsCount.0)',
                          style: TextStyle(color: AppColors.textColor2),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'People',
                      style: TextStyle(
                          fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Number of people in your group',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Wrap(
                      children: List.generate(widget.placesModel!.people!,
                              (index) {
                        return InkWell(
                          onTap: (){
                            setState(() {
                            cubit.changeColorSelected(index);
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: cubit.selectedIndex==index?Colors.black : Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(child: Text((index + 1).toString(),
                              style: TextStyle(fontWeight: FontWeight.w600,
                                color: cubit.selectedIndex==index?Colors.white : Colors.black),)),
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Description',
                      style: TextStyle(
                          fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ReadMoreText(
                      '${widget.placesModel!.description}',
                      trimLines: 4,
                      colorClickableText: Colors.pink,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      moreStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: AppColors.mainColor),
                      lessStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: AppColors.mainColor),
                      style: Theme.of(context).textTheme.caption,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              left: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.mainColor,
                        ),
                      ),
                      child: Icon(Icons.favorite_border,color: AppColors.mainColor,)
                  ),
                  defaultButton(
                      width: MediaQuery.of(context).size.width *0.75,
                      isResponsive: true,
                      text: 'book trip now'
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
