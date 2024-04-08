// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:select_shop/core/Shared/under_develop_screen.dart';
import 'package:select_shop/core/constans/app_images.dart';
import 'package:select_shop/core/functions/functions.dart';
import 'package:select_shop/core/theme/colors.dart';

TextStyle _customLocalTextStyle = TextStyle(
  color: AppColors.mainGreyColor,
);

TextStyle _customTitleTextStyle = TextStyle(
  color: AppColors.mainColor,
  fontWeight: FontWeight.bold,
  fontSize: 18,
);

TextEditingController _searchTextEditingController =
    new TextEditingController();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // top: false,
      child: Scaffold(
        appBar: CustomAppBar(),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return UnderDevScreen();
            }));
          },
          backgroundColor: AppColors.mainColor,
          child: Image.asset(
            AppImages.cartBig,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      clipBehavior: Clip.hardEdge,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          viewportFraction: 1,
                          // height: 75,

                          scrollDirection: Axis.vertical,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),

                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        ),
                        items: [1, 2, 3].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              // return Container(
                              //   height: 170,

                              //   width: MediaQuery.of(context).size.width - 30,

                              //   decoration: BoxDecoration(
                              //     color: Colors.amber,
                              //     image: DecorationImage(
                              //       image: AssetImage(
                              //         AppImages.mainCarouselSlider,
                              //       ),
                              //     ),
                              //   ),
                              //   // child: Image.asset(
                              //   //     fit: BoxFit.fill,
                              //   //     height: 170,
                              //   //     // width: double.infinity,
                              //   //     // height: double.infinity,
                              //   //     AppImages.mainCarouselSlider),
                              // );

                              return Image(
                                  height: 170,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    AppImages.mainCarouselSlider,
                                  ));
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 46,
                      child: SizedBox(
                        height: 80,
                        // width: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0; i < 3; i++)
                              AnimatedContainer(
                                duration: Duration(seconds: 1),
                                // width: _currentIndex == i ? 20 : 8.0,
                                width: 5,
                                height: 20,
                                margin: EdgeInsets.symmetric(horizontal: 2.0),
                                decoration: BoxDecoration(
                                  // shape: BoxShape.circle,
                                  color: _currentIndex == i
                                      ? AppColors.mainColor
                                      : Colors.grey,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            offset: Offset(3, 4),
                            color: AppColors.mainGreyColor.withOpacity(.2))
                      ],
                      borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return UnderDevScreen();
                          }));
                        },
                        child: Container(
                          width: 130,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6),
                                bottomLeft: Radius.circular(6),
                              )),
                          child: Text(
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              "categorys"),
                        ),
                      ),

// ##### this FormBuilder is casuing problems ##### //

                      // FormBuilder(
                      //   child: FormBuilderTextField(
                      //     name: "Search",
                      //     // style: _customLocalTextStyle,

                      //     // controller: TextEditingController?,

                      //     decoration: InputDecoration(
                      //       hintText: "Search...",
                      //       // hintStyle: _customLocalTextStyle,
                      //       border: InputBorder.none,
                      //       contentPadding: EdgeInsetsDirectional.symmetric(
                      //         horizontal: 20,
                      //       ),
                      //     ),
                      //   ),
                      // )

// #####  ##### //

//                       SearchBar(
//                         hintText: "Search...",

// // textStyle: TextStyle(color: ),
//                       ),

                      // AnimSearchBar(
                      //   width: 400,
                      //   textController: _searchTextEditingController,
                      //   onSuffixTap: () {
                      //     setState(() {
                      //       _searchTextEditingController.clear();
                      //     });
                      //   },
                      //   onSubmitted: (value) {},
                      // ),

                      // FormField(builder: (context) {
                      //   return Text('search');
                      // },
                      // ),
                      //
                      //

                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.search,
                        color: AppColors.mainGreyColor.withOpacity(.3),
                        size: 26,
                      ),

                      Text(
                        style: _customLocalTextStyle.copyWith(
                            fontSize: 18,
                            color: AppColors.mainGreyColor.withOpacity(.3),
                            backgroundColor: Colors.white),
                        "Search...",
                      ),
                    ],
                  ),
                ),

                ////////////////////////////////
                ///
                ///
                ///
                ////////////////////////////////

                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      style: _customTitleTextStyle,
                      "Categories: ",
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return UnderDevScreen();
                        }));
                      },
                      child: Text(
                        style: _customTitleTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.mainColor),
                        "show all:",
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),
                Container(
                  // height: 140,
                  height: 170,

                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor.withOpacity(.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (int i = 0; i < 10; i++)
                        Column(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.mainGreyColor
                                          .withOpacity(.3),
                                      blurRadius: 3,
                                      offset: Offset(3, 3),
                                    ),
                                  ],
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      AppImages.mainCarouselSlider,
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              style: _customTitleTextStyle.copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                              "Categories ",
                            ),
                          ],
                        ),
                    ],
                  ),
                ),

                ////////////////////////////////
                ///
                ///
                ///
                ////////////////////////////////

                ////////////////////////////
                ///
                ///
                ///////////////////////////

                CustomBanar(),

                ////////////////////////////
                ///
                ///
                ///////////////////////////
                CustomBanar(),

                ////////////////////////////
                ///
                ///
                ///////////////////////////
                CustomBanar(),

                ////////////////////////////
                ///
                ///
                ///////////////////////////
                CustomBanar(),

                ////////////////////////////
                ///
                ///
                ///////////////////////////
              ],
            ),
          ),
        ),
        // bottomNavigationBar: ConvexAppBar(
        //   style: TabStyle.react,
        //   items: [
        //     TabItem(icon: Icons.list),
        //     TabItem(icon: Icons.calendar_today),
        //     TabItem(icon: Icons.assessment),
        //   ],
        //   initialActiveIndex: 1,
        //   onTap: (int i) => print('click index=$i'),
        // ),

        bottomNavigationBar: _CustomBottomNavBar(),
      ),
    );
  }
}

class _CustomBottomNavBar extends StatelessWidget {

  
  const _CustomBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        // vertical: 10,
      ),
      width: double.infinity,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.mainGreyColor.withOpacity(.1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          )),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  width: 34,
                  height: 34,
                  image: AssetImage(
                    AppImages.home,
                  ),
                ),
                Text(
                  "Home",
                  style:
                      TextStyle(color: Color.fromARGB(255, 0, 255, 221), fontSize: 10),
                )
              ],
            ),
          ),

          //////
          ///
          ///
          ///
          ///
          Spacer(),

          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  width: 34,
                  height: 34,
                  image: AssetImage(
                    AppImages.catigeores,
                  ),
                ),
                Text(
                  "categories",
                  style:
                      TextStyle(color: AppColors.mainGreyColor, fontSize: 10),
                )
              ],
            ),
          ),

          //////
          ///
          ///
          ///
          ///
          Spacer(),
          Spacer(),
          Spacer(),
          //////
          ///
          ///
          ///
          ///

          InkWell(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  width: 34,
                  height: 34,
                  image: AssetImage(
                    AppImages.favFilled,
                  ),
                ),
                Text(
                  "favourite",
                  style:
                      TextStyle(color: AppColors.mainGreyColor, fontSize: 10),
                )
              ],
            ),
          ),

          //////
          ///
          ///
          ///
          ///
          Spacer(),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  width: 34,
                  height: 34,
                  image: AssetImage(
                    AppImages.person,
                  ),
                ),
                Text(
                  "personal",
                  style:
                      TextStyle(color: AppColors.mainGreyColor, fontSize: 10),
                )
              ],
            ),
          ),

          //////
          ///
          ///
          ///
          ///
        ],
      ),
    );
  }
}

class CustomBanar extends StatelessWidget {
  const CustomBanar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              style: _customTitleTextStyle,
              "Most Wanted: ",
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UnderDevScreen();
                }));
              },
              child: Text(
                style: _customTitleTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.mainColor),
                "show all:",
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return UnderDevScreen();
            }));
          },
          child: Container(
            // height: 140,
            height: 280,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.mainGreyColor.withOpacity(.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 15),
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0; i < 10; i++)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return UnderDevScreen();
                      }));
                    },
                    child: Container(
                      width: 180,
                      height: 170,
                      margin: EdgeInsets.only(right: 10),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            8,
                          )),
                      child: Column(
                        children: [
                          Flexible(
                            flex: 3,
                            child: Stack(
                              children: [
                                Container(
                                  // margin: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      // fit: BoxFit.none,
                                      image: AssetImage(
                                        AppImages.mainCarouselSlider,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 45,
                                      height: 25,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(8),
                                        ),
                                        color: AppColors.kyellowColor,
                                      ),
                                      child: Text(
                                        "new",
                                        style: _customTitleTextStyle.copyWith(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(
                                5,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          style: TextStyle(fontSize: 10),
                                          "Category:"),
                                      Text(
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: AppColors.mainColor),
                                          "home"),
                                      Spacer(),
                                      Row(
                                        children: [
                                          for (int i = 1; i <= 5; i++)
                                            Icon(
                                              size: 12,
                                              color: AppColors.mainColor,
                                              Icons.star_rounded,
                                            )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          "women sport shose"),
                                      Spacer(),
                                      Text(
                                        "chanel".toUpperCase(),
                                        style: _customTitleTextStyle.copyWith(
                                          fontSize: 10,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Image.asset(
                                        AppImages.chanelLogoJfif,
                                        width: 12,
                                        height: 12,
                                      )
                                    ],
                                  ),

                                  ///
                                  ///
                                  ///
                                  ///

                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          "AED 350"),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "AED 266".toUpperCase(),
                                        style: _customTitleTextStyle.copyWith(
                                          fontSize: 10,
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 38,
                                        height: 15,
                                        decoration: BoxDecoration(
                                          color: AppColors.mainColor
                                              .withOpacity(.1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Image.asset(
                                          height: 10,
                                          width: 510,
                                          AppImages.cartSmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,

    // this.height = kToolbarHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(155),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        // height: 55,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              // color: Colors.grey.withOpacity(0.5),
              color: Color(0xff000000).withOpacity(.16),
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UnderDevScreen();
                }));
              },
              child: Image(
                image: AssetImage(
                  AppImages.menu,
                ),
              ),
            ),
            Row(
              children: [
                Image(
                  height: 40,
                  width: 40,
                  image: AssetImage(
                    AppImages.logoSmall,
                  ),
                ),
                Image(
                  image: AssetImage(
                    AppImages.selectShopText,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return UnderDevScreen();
                }));
              },
              child: Image(
                image: AssetImage(
                  AppImages.notification,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        55,
      );
}
