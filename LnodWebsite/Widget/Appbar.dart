import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../main.dart';
import '../../screens/dashboard_screen.dart';
import '../../screens/home/components/user_detail_bottomsheet_widget.dart';
import '../../screens/post/screens/add_post_screen.dart';
import '../../screens/shop/screens/shop_screen.dart';
import '../../utils/cached_network_image.dart';
import '../../utils/images.dart';

class Appbarr extends StatefulWidget {
  const Appbarr({Key? key}) : super(key: key);

  @override
  State<Appbarr> createState() => _AppbarrState();
}

class _AppbarrState extends State<Appbarr> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
     
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
          icon: Image.asset(ic_plus, height: 22, width: 22, fit: BoxFit.fitWidth, color: context.iconColor),
        ),
        if (appStore.showWoocommerce == 1 && appStore.isShopEnable == 1)
          Image.asset(ic_bag, height: 24, width: 24, fit: BoxFit.fitWidth, color: context.iconColor).onTap(() {
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
    );
  }
}

