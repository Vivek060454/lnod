
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:socialv/LnodWebsite/url.dart';

import 'package:webview_flutter/webview_flutter.dart';

import '../../main.dart';
import '../../screens/dashboard_screen.dart';
import '../../screens/home/components/user_detail_bottomsheet_widget.dart';
import '../../screens/post/screens/add_post_screen.dart';
import '../../screens/shop/screens/shop_screen.dart';
import '../../utils/cached_network_image.dart';
import '../../utils/images.dart';
import '../Widget/Draweer.dart';

class Podcast extends StatefulWidget {
  const Podcast({Key? key}) : super(key: key);

  @override
  State<Podcast> createState() => _PodcastState();
}

class _PodcastState extends State<Podcast> {
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
          controller.runJavaScript(
              "document.getElementsByTagName('header')[0].style.display='none'");
          controller.runJavaScript(
              "document.getElementsByTagName('footer')[0].style.display='none'");

        },
      ))
      ..loadRequest(
        Uri.parse(Url().podcast),
          headers : {  "Authorization": "Bearer ${ appStore.token.toString()}" }
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar:  AppBar(
        backgroundColor: appStore.isDarkMode?Colors.black:Colors.white,
        elevation: 0,
        leading:  Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8,),
              child: Image.asset('assets/LNOD-Communities-Logo-1_page-0001-1.jpg',height:70,width: 80,),
            )),

        actions: [
          IconButton(
            onPressed: () {
              AddPostScreen().launch(context).then((value) {
                if (value ?? false) {
                  selectedIndex = 0;
                  // tabController.index = 0;
                  setState(() {});
                }
              });
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Image.asset(ic_plus, height: 22, width: 22, fit: BoxFit.fitWidth, color: appStore.isDarkMode? context.iconColor:Colors.black),
          ),
          if (appStore.showWoocommerce == 1 && appStore.isShopEnable == 1)
            Image.asset(ic_bag, height: 24, width: 24, fit: BoxFit.fitWidth, color:appStore.isDarkMode? context.iconColor:Colors.black).onTap(() {
              ShopScreen().launch(context);
            }, splashColor: Colors.transparent, highlightColor: Colors.transparent).paddingSymmetric(horizontal: 8),
          Observer(
            builder: (_) => IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () {
                showModalBottomSheet(
                  elevation: 0,
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  // transitionAnimationController: _animationController,
                  builder: (context) {
                    return FractionallySizedBox(
                      heightFactor: 0.93,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 45,
                            height: 5,
                            //clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white),
                          ),
                          8.height,
                          Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              color: context.cardColor,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                            ),
                            child: UserDetailBottomSheetWidget(
                              callback: () {
                                //mPage = 1;
                                //future = getPostList();
                              },
                            ),
                          ).expand(),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: cachedImage(appStore.loginAvatarUrl, height: 30, width: 30, fit: BoxFit.cover).cornerRadiusWithClipRRect(15),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.only(
          //         // bottomRight: Radius.circular(20),
          //         //   bottomLeft: Radius.circular(50)
          //       )
          //   ),
          //   child: Column(
          //     children: [
          //       SizedBox(
          //         height: 50,
          //       ),
          //       Table(
          //         columnWidths: {
          //           0:FlexColumnWidth(4),
          //           1:FlexColumnWidth(1),
          //           2:FlexColumnWidth(1),
          //           3:FlexColumnWidth(2),
          //         },
          //         children: [
          //           TableRow(
          //               children: [
          //                 Align(
          //                     alignment: Alignment.topLeft,
          //                     child: Padding(
          //                       padding: const EdgeInsets.only(left: 8,top: 2),
          //                       child: Image.asset('assets/LNOD-Communities-Logo-1_page-0001-1.jpg',height:50,),
          //                     )),
          //                 Align(
          //                   alignment: Alignment.topRight,
          //                   child: Padding(
          //                       padding: const EdgeInsets.only(left: 25,top: 8),
          //                       child: SvgPicture.asset(
          //                         'assets/search-magnifying-glass-svgrepo-com.svg',
          //                         width: 40,
          //                         height: 40,
          //                       )
          //                   ),
          //                 ),
          //                 Align(
          //                   alignment: Alignment.topRight,
          //                   child: Padding(
          //                       padding: const EdgeInsets.only(left: 25,top: 8),
          //                       child: SvgPicture.asset(
          //                         'assets/shopping-cart-4-svgrepo-com.svg',
          //                         width: 40,
          //                         height: 40,
          //                       )
          //                   ),
          //                 ),
          //                 Align(
          //                   alignment: Alignment.topRight,
          //                   child: Padding(
          //                       padding: const EdgeInsets.only(right: 15,top: 13),
          //                       child: InkWell(
          //                         onTap: (){
          //                           _key.currentState!.openEndDrawer();
          //
          //                         },
          //                         child: SvgPicture.asset(
          //                           'assets/menu.svg',
          //                           width: 30,
          //                           height: 30,
          //                         ),
          //                       )
          //                   ),
          //                 ),
          //               ]
          //           )
          //         ],
          //       ),
          //
          //       SizedBox(
          //         height: 20,
          //       ),
          //
          //     ],
          //   ),
          // ),
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
