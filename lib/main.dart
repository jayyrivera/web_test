import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:web_test/constants.dart';
import 'package:web_test/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        builder: (context, child) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(600, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
          ],
        ),
        routerConfig: router,
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    print(Device.screenType);
    print(Constants.list1['data'].length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              /// nav bar and dash
              Stack(
                children: [
                  SizedBox(
                    width: screenSize.width,
                    height: 70.0.h,
                    child: Image.network(
                      'https://s3-alpha-sig.figma.com/img/ecc3/0b26/4dec472c8d52914ff4628a369c689a6d?Expires=1680480000&Signature=kwfONZuDSr5qG~uk8Vfp~L70bCSqQgWesK5k6FL0-cyUs7w4ynxRolYqX3y9SnvX0ofBULsp5cS6mjJKUtQa2b~GD6KtrrWeqZH58hXuKvfg~zoEAELJNhIR8Fpni7yjvOCipOHJQZtLmB37MpJY-MGMq9H5eWnqsKcDPAO2D3LkAi~HarpF-oSPMrbNwkPP6Y6Fgy1lmGHyGedIzOrHrRy5YjkorwX28fpw7ryJu9ZPG8Fdi4~3XcwNyANizRtwPpV-t4krNwLhaNkBHeQ-SjWUvi0l52vqnP~LvU6CSlYYFELb4Vpl4yO1c3nDscdyEViIvlyyXmKDmFV8ZsA3mw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: Device.screenType == ScreenType.mobile
                            ? false
                            : true,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: const Text('Help',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        color: Colors.black)),
                              ),
                              SizedBox(
                                height: 0.5.h,
                                child: const VerticalDivider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: const Text('Join Us',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        color: Colors.black)),
                              ),
                              SizedBox(
                                height: 0.5.h,
                                child: const VerticalDivider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: const Text('Sign In',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        color: Colors.black)),
                              ),
                              const VerticalDivider()
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      PreferredSize(
                        preferredSize: Size(screenSize.width, 1000),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0.sp),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (Device.screenType == ScreenType.mobile)
                                  InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.menu,
                                      color: Color(0xFFD9D9D9),
                                    ),
                                  )
                                else
                                  CircleAvatar(
                                    backgroundColor: const Color(0xFFD9D9D9),
                                    child: Text(
                                      'LOGO',
                                      style: TextStyle(
                                          fontSize: 12.0.px,
                                          color: Colors.black),
                                    ),
                                  ),
                                Visibility(
                                    visible:
                                        Device.screenType == ScreenType.mobile
                                            ? false
                                            : true,
                                    child: const Spacer()),
                                if (Device.screenType == ScreenType.mobile) ...[
                                  const Spacer(),
                                  Center(
                                    child: CircleAvatar(
                                        backgroundColor:
                                            const Color(0xFFD9D9D9),
                                        child: Text(
                                          'LOGO',
                                          style: TextStyle(
                                              fontSize: 12.0.px,
                                              color: Colors.black),
                                        )),
                                  ),
                                  const Spacer(),
                                ] else
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          'Home'.toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0.px),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 1.5.w,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          'New Arrival'.toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0.px),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 1.5.w,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          'Shop'.toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0.px),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 1.5.w,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          'Last Collection'.toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0.px),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 1.5.w,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          'Men'.toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0.px),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 1.5.w,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          'Women'.toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0.px),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 1.5.w,
                                      )
                                    ],
                                  ),
                                Spacer(),
                                ...[
                                  Visibility(
                                    visible:
                                        Device.screenType == ScreenType.mobile
                                            ? false
                                            : true,
                                    child: Container(
                                      width: 8.0.w,
                                      height: 3.0.h,
                                      decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          prefixIcon: const Icon(
                                            Icons.search,
                                            color: Colors.black,
                                          ),
                                          filled: true,
                                          isDense: true,
                                          hintStyle:
                                              TextStyle(fontSize: 14.0.px),
                                          hintText: "Search",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible:
                                        Device.screenType == ScreenType.mobile
                                            ? false
                                            : true,
                                    child: SizedBox(
                                      width: 0.5.w,
                                    ),
                                  ),
                                ],
                                InkWell(
                                  onTap: () {},
                                  child: badges.Badge(
                                    badgeStyle: const badges.BadgeStyle(
                                        badgeColor: Color(0x00D9D9D9)),
                                    position: badges.BadgePosition.topEnd(
                                      top: 8,
                                    ),
                                    badgeContent: Text(
                                      '0',
                                      style: TextStyle(fontSize: 8.0.px),
                                    ),
                                    child: Image.asset(
                                      'assets/bag.png',
                                      height: 2.0.h,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 1.0.w,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assets/star.png',
                                    height: 2.0.h,
                                  ),
                                ),
                                SizedBox(
                                  width: 1.0.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: FittedBox(
                          child: SizedBox(
                            width: screenSize.width,
                            height: 60.0.h,
                            child: Stack(
                              children: [
                                if (Device.screenType != ScreenType.mobile) ...[
                                  Image.network(
                                    'https://s3-alpha-sig.figma.com/img/e89c/f26b/32f1960f5fd196b63b1ead26c8d4be96?Expires=1680480000&Signature=bdG1BCdv5Rw6DGS0jaV2pv5XKbtVBBQ-Kv1lFPKUzrhVVK6i1oV4J1bEkyFGEUoKhJFJKHujS-PVtk8Kkh4qaaA7FoI7caEW58KRADwCXukTQ5k6GzJsdfSseZymktx90TO65rNcq510T-rOKShHQdpYJUg8MClYTvYSI9L4SMtQQkRGoLHLESRh4zHaKTVoC1VVNEgchdIgGvDBGnyt5z6cGMIYeH85wmru0ZQ2HCesfohGqLO2ytdYDMgUAwMNbt~zS7v1HsblwEIIL2GvUAz4AeLHs1LzcBvBWkItRW-IdgHk4f53MtmyY9pfqk3Ff2e6M5mtYRl~m1gxcTM2Sw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                    fit: BoxFit.fitWidth,
                                    width: 22.5.w,
                                    height: 45.0.h,
                                  ),
                                  Positioned(
                                    right: 0.0,
                                    child: Image.network(
                                      'https://s3-alpha-sig.figma.com/img/14ec/0eec/2341b409d2f20d7a132442d0160e9527?Expires=1680480000&Signature=B9wODob462ymZws7hqvK4Q3IKT6bpJj9XC7qihoNjEdHRwws9vs9FqfFGgrFWuDHKdMQTSFrxufLqX5PVHotUPkSqBEIVsijzIXiIJf6806F-1bzW~vZPJ8RFQv9D8qqd0zCi6yzIB~FjQTy59rDamswzTRc9bpRt3mJ4HtA1HJSqXK6Dz9IHqxwP~WWaxljod10XJyM9rWVRmsOFnsUHYxZTcOsFmUfisIQoSS6kb7ZPDV7XSqswpxxkaB5cnKZKVQzggX2azSSNZrGP~vLiydIwppcarNWrkzd-yclUQZyjs~Tjv1pnGfVs3neSyqt6fZ7R-RxiuKm9gk~sidhzg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                      fit: BoxFit.fitWidth,
                                      height: 45.0.h,
                                      width: 30.0.w,
                                    ),
                                  ),
                                  Positioned(
                                    top: 55.0,
                                    right: 60.0,
                                    left: -50.0,
                                    child: Image.network(
                                      'https://s3-alpha-sig.figma.com/img/d66c/2cc5/6831545ced7117bb9d7215f555198a67?Expires=1680480000&Signature=PHHfrgq~qlViWEwEksUVddQzgwE37s-OCeg2wpCwhUqvfN15zrs0KJYvP2Sa6-CiuDStg75bGvXwy3LHULLdOhJ2N~7wgSF4WC8X~jIiRNJ4DujP4eglvtyLXQ92ldQ4gdyXvDMkSTZN6xAiS9FGp-5yD~21KsumMK3qlNyZ4Yd2s141vFM5929lw-YgSS18P8qvyxJ5ZvNG4cb1xcJrE0OKEouboLju8k1EDKtBEHGcZT8no6nrvOzxJcYpQeoYIj3qzCxeRp8qTaVUlMoQgpNNhRuzdR~-M1Zl61OwnmiElcOW0f4M7OJ0DvZqvY59hP0qq7HgkgKVb1bmZ3Xl-g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                      height: 45.0.h,
                                    ),
                                  ),
                                ] else ...[
                                  Positioned(
                                    top: 0,
                                    right: 0.0,
                                    child: Image.network(
                                      'https://s3-alpha-sig.figma.com/img/14ec/0eec/2341b409d2f20d7a132442d0160e9527?Expires=1680480000&Signature=B9wODob462ymZws7hqvK4Q3IKT6bpJj9XC7qihoNjEdHRwws9vs9FqfFGgrFWuDHKdMQTSFrxufLqX5PVHotUPkSqBEIVsijzIXiIJf6806F-1bzW~vZPJ8RFQv9D8qqd0zCi6yzIB~FjQTy59rDamswzTRc9bpRt3mJ4HtA1HJSqXK6Dz9IHqxwP~WWaxljod10XJyM9rWVRmsOFnsUHYxZTcOsFmUfisIQoSS6kb7ZPDV7XSqswpxxkaB5cnKZKVQzggX2azSSNZrGP~vLiydIwppcarNWrkzd-yclUQZyjs~Tjv1pnGfVs3neSyqt6fZ7R-RxiuKm9gk~sidhzg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                      fit: BoxFit.fill,
                                      height: 20.0.h,
                                      width: 60.0.w,
                                    ),
                                  ),
                                  Positioned(
                                    top: 110,
                                    right: 180.0,
                                    child: Image.network(
                                      'https://s3-alpha-sig.figma.com/img/d66c/2cc5/6831545ced7117bb9d7215f555198a67?Expires=1680480000&Signature=PHHfrgq~qlViWEwEksUVddQzgwE37s-OCeg2wpCwhUqvfN15zrs0KJYvP2Sa6-CiuDStg75bGvXwy3LHULLdOhJ2N~7wgSF4WC8X~jIiRNJ4DujP4eglvtyLXQ92ldQ4gdyXvDMkSTZN6xAiS9FGp-5yD~21KsumMK3qlNyZ4Yd2s141vFM5929lw-YgSS18P8qvyxJ5ZvNG4cb1xcJrE0OKEouboLju8k1EDKtBEHGcZT8no6nrvOzxJcYpQeoYIj3qzCxeRp8qTaVUlMoQgpNNhRuzdR~-M1Zl61OwnmiElcOW0f4M7OJ0DvZqvY59hP0qq7HgkgKVb1bmZ3Xl-g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                      fit: BoxFit.cover,
                                      width: 60.0.w,
                                      height: 30.0.h,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    right: 25.0,
                                    child: Image.network(
                                      'https://s3-alpha-sig.figma.com/img/e89c/f26b/32f1960f5fd196b63b1ead26c8d4be96?Expires=1680480000&Signature=bdG1BCdv5Rw6DGS0jaV2pv5XKbtVBBQ-Kv1lFPKUzrhVVK6i1oV4J1bEkyFGEUoKhJFJKHujS-PVtk8Kkh4qaaA7FoI7caEW58KRADwCXukTQ5k6GzJsdfSseZymktx90TO65rNcq510T-rOKShHQdpYJUg8MClYTvYSI9L4SMtQQkRGoLHLESRh4zHaKTVoC1VVNEgchdIgGvDBGnyt5z6cGMIYeH85wmru0ZQ2HCesfohGqLO2ytdYDMgUAwMNbt~zS7v1HsblwEIIL2GvUAz4AeLHs1LzcBvBWkItRW-IdgHk4f53MtmyY9pfqk3Ff2e6M5mtYRl~m1gxcTM2Sw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                      fit: BoxFit.cover,
                                      height: 25.0.h,
                                      width: 50.0.w,
                                    ),
                                  ),
                                ]
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),

              /// first item
              Container(
                color: const Color(0x00EBEAE8),
                padding: EdgeInsets.all(14.0.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (Device.screenType == ScreenType.mobile)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          for (var item in Constants.list1['data'])
                            Center(
                              child: SizedBox(
                                width: 50.0.w,
                                child: Card(
                                  elevation: 5.0,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0.sp),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Image.network(
                                        item['image'],
                                        fit: BoxFit.contain,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Chip(
                                            label: Text(
                                              item['name'],
                                              style: const TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            elevation: 6.0,
                                            backgroundColor: Colors.white,
                                            padding: EdgeInsets.only(
                                                left: 12.0.sp, right: 12.0.sp),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      )
                    else
                      FittedBox(
                        child: SizedBox(
                          height: 50.0.h,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (var item in Constants.list1['data']) ...[
                                Card(
                                  elevation: 5.0,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.network(
                                        item['image'],
                                        fit: BoxFit.cover,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Chip(
                                            label: Text(
                                              item['name'],
                                              style: const TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            elevation: 6.0,
                                            backgroundColor: Colors.white,
                                            padding: EdgeInsets.only(
                                                left: 12.0.sp, right: 12.0.sp),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 0.5.w,
                                )
                              ]
                            ],
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 5.0.h,
                    ),
                    Visibility(
                      visible:
                          Device.screenType == ScreenType.mobile ? false : true,
                      child: Padding(
                        padding: EdgeInsets.only(left: 32.0.sp, right: 32.0.sp),
                        child: Text(
                          Constants.list1['description'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0.px, fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              /// small bar
              Card(
                  elevation: 5.0,
                  child: Container(
                    child: Device.screenType == ScreenType.mobile
                        ? Center(
                            child: Text(
                              'SALE',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30.0.px),
                            ),
                          )
                        : Padding(
                            padding:
                                EdgeInsets.only(left: 24.0.sp, right: 24.0.sp),
                            child: SizedBox(
                              width: double.infinity,
                              child: FittedBox(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('SALE',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 30.0.px)),
                                    SizedBox(
                                      width: 0.5.w,
                                    ),
                                    Text('SALE',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 30.0.px)),
                                    SizedBox(
                                      width: 0.5.w,
                                    ),
                                    Text('SALE',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 30.0.px)),
                                    SizedBox(
                                      width: 0.5.w,
                                    ),
                                    Text('SALE',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 30.0.px)),
                                    SizedBox(
                                      width: 0.5.w,
                                    ),
                                    Text('SALE',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 30.0.px)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  )),

              ///Grid view
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: Device.screenType == ScreenType.mobile
                          ? 2 / 2
                          : 3 / 4,
                      crossAxisCount:
                          Device.screenType == ScreenType.mobile ? 2 : 4,
                      crossAxisSpacing: 14.0,
                      mainAxisSpacing: 14.0),
                  itemCount: Constants.list2['data'].length,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(24.0.sp),
                  itemBuilder: (BuildContext ctx, index) {
                    var item = Constants.list2['data'][index];
                    return Stack(
                      children: [
                        FittedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                elevation: 5.0,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0.sp),
                                ),
                                child: Image.network(
                                  item['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              Text(
                                item['name'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0.px),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                item['desc'],
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 18.0.px),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right:
                              Device.screenType == ScreenType.mobile ? 30 : -2,
                          child: Container(
                            padding: EdgeInsets.all(6.0.sp),
                            color: const Color(0xFFE0CA9E),
                            child: Text(
                              item['discountFlag'],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 14.0.px,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }),

              Center(
                child: Chip(
                  label: const Text(
                    'More',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  elevation: 6.0,
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.only(left: 12.0.sp, right: 12.0.sp),
                ),
              ),
              SizedBox(
                height: 5.0.h,
              ),

              /// END
              Container(
                color: const Color(0xFFEBEAE8),
                padding: EdgeInsets.all(24.0.sp),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: const Color(0xFFD9D9D9),
                            child: Text(
                              'LOGO',
                              style: TextStyle(
                                  fontSize: 12.0.px, color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 2.5.h,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.send),
                              SizedBox(
                                width: 1.5.w,
                              ),
                              const Flexible(
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                  maxLines: 2,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.phone_android),
                              SizedBox(
                                width: 1.5.w,
                              ),
                              const Flexible(
                                child: Text(
                                  'Lorem ipsum',
                                  maxLines: 2,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.mail),
                              SizedBox(
                                width: 1.5.w,
                              ),
                              const Flexible(
                                child: Text(
                                  'Lorem ipsum',
                                  maxLines: 2,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Image.asset(
                            'assets/social.png',
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    if (Device.screenType != ScreenType.mobile) ...[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Collection'.toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.px,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'Lorem ipsum',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0.px,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'Lorem ipsum',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0.px,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'Lorem ipsum',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0.px,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'Lorem ipsum',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0.px,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'Lorem ipsum',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0.px,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'Lorem ipsum',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0.px,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'Lorem ipsum',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0.px,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5.5.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'INFORMATION',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.px,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'Lorem ipsum',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0.px,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'Lorem ipsum',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0.px,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'Lorem ipsum',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0.px,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'Lorem ipsum',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0.px,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'Lorem ipsum',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0.px,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'Lorem ipsum',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0.px,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'Lorem ipsum',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0.px,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5.5.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'More'.toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0.px,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'Lorem ipsum',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0.px,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'Lorem ipsum',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0.px,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'Lorem ipsum',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0.px,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'Lorem ipsum',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0.px,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'Lorem ipsum',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0.px,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'Lorem ipsum',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0.px,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'Lorem ipsum',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0.px,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                        ],
                      ),
                    ]
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
