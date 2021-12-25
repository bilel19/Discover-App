import 'package:discover_app/misc/colors.dart';
import 'package:discover_app/modules/home_screen.dart';
import 'package:discover_app/shared/components/components.dart';
import 'package:discover_app/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingScreen extends StatelessWidget {

  var BoardController=PageController();

  List<String> images = [
    'assets/images/welcome-one.png',
    'assets/images/welcome-three.png',
    'assets/images/welcome-two.png',
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView.builder(
        physics: BouncingScrollPhysics(),
        controller: BoardController,
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (context, index) =>
            buildWelcomePages(images[index], context),
      ),
    );
  }

  Widget buildWelcomePages(String url, context) => Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(url),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 150, left: 20,right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Trips',
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Mountain',
                    style: TextStyle(fontSize: 25,color: AppColors.textColor2),
                  ),
                  SizedBox(
                    height: 10,),
                  Container(
                    width: 200,
                    child: Text(
                      'Mountain hikes give you an incredible sense of freedom along with endurence test.',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  SizedBox(
                    height: 40,),
                  InkWell(
                    onTap: (){
                      NavigateAndFinish(context, HomeScreen());
                    },
                      child: defaultButton()),
                ],
              ),
              SmoothPageIndicator(
                controller: BoardController,
                count: images.length,
                axisDirection: Axis.vertical,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppColors.mainColor,
                  dotColor: Colors.grey,
                  dotHeight: 7,
                  dotWidth: 7,
                  spacing: 5,
                  expansionFactor: 4,
                ),
              ),
            ],
          ),
        ),
      );
}
