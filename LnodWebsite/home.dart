import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialv/LnodWebsite/url.dart';

import 'package:webview_flutter/webview_flutter.dart';

import '../main.dart';
import 'Widget/Draweer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  late final WebViewController controller;
  var loadingPercentage = 0;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(
        Uri.parse(Url().home),
          headers : {"Authorization": "Bearer " + appStore.token.toString()}
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer:  Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                // topRight: Radius.circular(20),
                // bottomRight: Radius.circular(20)
            ),
          ),

          child: Draweer()
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  // bottomRight: Radius.circular(20),
                  //   bottomLeft: Radius.circular(50)
                )
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Table(
                  columnWidths: {
                    0:FlexColumnWidth(4),
                    1:FlexColumnWidth(1),
                    2:FlexColumnWidth(1),
                    3:FlexColumnWidth(2),
                  },
                  children: [
                    TableRow(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8,top: 2),
                                child: Image.asset('assets/LNOD-Communities-Logo-1_page-0001-1.jpg',height:50,),
                              )),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 25,top: 8),
                                child: SvgPicture.asset(
                                  'assets/search-magnifying-glass-svgrepo-com.svg',color: Colors.black,
                                  width: 40,
                                  height: 40,
                                )
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 25,top: 8),
                                child: SvgPicture.asset(
                                  'assets/shopping-cart-4-svgrepo-com.svg',
                                  width: 40,
                                  height: 40,
                                )
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15,top: 13),
                              child: InkWell(
                                onTap: (){
                                  _key.currentState!.openEndDrawer();

                                },
                                child: SvgPicture.asset(
                                  'assets/menu.svg',
width: 30,
                                  height: 30,
                                ),
                              )
                            ),
                          ),
                        ]
                    )
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

              ],
            ),
          ),
Flexible(child:WebViewWidget(
  controller: controller,
),),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            ),

        ],
      ),
    );
  }
}
