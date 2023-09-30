import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:socialv/Memabership/PurchaseApi.dart';
import 'package:socialv/utils/app_constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../Memabership/paywall.dart';
import '../../main.dart';
import '../../models/membership_response.dart';
import '../../network/rest_apis.dart';
import '../../screens/dashboard_screen.dart';
import '../../screens/home/components/user_detail_bottomsheet_widget.dart';
import '../../screens/post/screens/add_post_screen.dart';
import '../../screens/shop/screens/shop_screen.dart';
import '../../utils/cached_network_image.dart';
import '../../utils/images.dart';
import '../Widget/Draweer.dart';
import '../corporatemembership.dart';

class Membership extends StatefulWidget {
  const Membership({Key? key}) : super(key: key);

  @override
  State<Membership> createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
   List? offering=[];
  List? packages=[];
  bool checkingmembership=false;
@override
  void initState() {
   checkmembership();



    // TODO: implement initState
    super.initState();
  }
   Future<List<MemebershipResponse>> checkmembership()async{

    await membershipcheck().then((value){
      fetctOffers();
      print("#######################checkmembership#######");
      if(value[0]['is_membership_on']==true){

        setState(() {
          checkingmembership=value[0]['is_membership_on'];
        });
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Membership()));
        print("#######################checkmembershipdfg#######");
      }
      else if(value[0]['is_membership_on']==false){
        print("######cshipdfjfgfghg#######");
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Membership()));
        // push(Membership(), isNewTask: true, pageRouteAnimation: PageRouteAnimation.Slide);



      }
      else{

        print("######cshipdfjhg#######");
      }
      print(value[0]['is_membership_on']);

print(checkingmembership);
      print(value);
      setState(() {

      });


    }
    ).catchError((e) {
      print(e);
      print("####checkmembershipdfrthdryjhg#######");
      print(e);
      setState(() { });
      print(e);
    });
    return [];
  }
     fetctOffers() async{
       offering =await PurchaseApi.fetchOffers();
       print("###########$offering");

        packages=offering?.map((offer) => offer.availablePackages)
           .expand((pair) => pair)
           .toList();
       setState(() {

       });
      //    if(value.isEmpty){
      //      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No Plans Found')));
      //    }
      //    else {
      //      packages=value.map((offer) => offer.availablePackages)
      //          .expand((pair) => pair)
      //          .toList();
      //      // showModalBottomSheet(
      //      //     context: context,
      //      //     builder: (context)=>Paywall(
      //      //         packages:packages,
      //      //         title:"Uprage your plan",
      //      //         description:"Uprage",
      //      //         onClickedPackeges:(package)async{
      //      //           await PurchaseApi.purchasePackage(package);
      //      //         }
      //      //     )
      //      // );
      //      final offer = offering.first;
      //      print('Offer: $offer');
      //
      //    }
      //    setState(() {
      //
      //    });
      //  });
      //
      // print('dcf'+offering.toString());


    }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: _key,
      appBar:  AppBar(
        backgroundColor: appStore.isDarkMode?Colors.black:Colors.white,
        titleSpacing: 0,
        title: Text( "Membership", style: boldTextStyle(size: 22)),
        elevation: 0,
        centerTitle: true,
        // leading:  Align(
        //     alignment: Alignment.topLeft,
        //     child: Padding(
        //       padding: const EdgeInsets.only(left: 8,),
        //       child: InkWell(
        //           onTap: (){
        //             Navigator.pop(context);
        //           },
        //           child: Image.asset('assets/LNOD-Communities-Logo-1_page-0001-1.jpg',height:70,width: 80,)),
        //     )),

        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       AddPostScreen().launch(context).then((value) {
        //         if (value ?? false) {
        //           selectedIndex = 0;
        //           // tabController.index = 0;
        //           setState(() {});
        //         }
        //       });
        //     },
        //     highlightColor: Colors.transparent,
        //     splashColor: Colors.transparent,
        //     icon: Image.asset(ic_plus, height: 22, width: 22, fit: BoxFit.fitWidth, color: appStore.isDarkMode? context.iconColor:Colors.black),
        //   ),
        //   if (appStore.showWoocommerce == 1 && appStore.isShopEnable == 1)
        //     Image.asset(ic_bag, height: 24, width: 24, fit: BoxFit.fitWidth, color:appStore.isDarkMode? context.iconColor:Colors.black).onTap(() {
        //       ShopScreen().launch(context);
        //     }, splashColor: Colors.transparent, highlightColor: Colors.transparent).paddingSymmetric(horizontal: 8),
        //   Observer(
        //     builder: (_) => IconButton(
        //       highlightColor: Colors.transparent,
        //       splashColor: Colors.transparent,
        //       onPressed: () {
        //         showModalBottomSheet(
        //           elevation: 0,
        //           context: context,
        //           isScrollControlled: true,
        //           backgroundColor: Colors.transparent,
        //           // transitionAnimationController: _animationController,
        //           builder: (context) {
        //             return FractionallySizedBox(
        //               heightFactor: 0.93,
        //               child: Column(
        //                 mainAxisSize: MainAxisSize.min,
        //                 children: [
        //                   Container(
        //                     width: 45,
        //                     height: 5,
        //                     //clipBehavior: Clip.hardEdge,
        //                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white),
        //                   ),
        //                   8.height,
        //                   Container(
        //                     clipBehavior: Clip.antiAliasWithSaveLayer,
        //                     decoration: BoxDecoration(
        //                       color: context.cardColor,
        //                       borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        //                     ),
        //                     child: UserDetailBottomSheetWidget(
        //                       callback: () {
        //                         //mPage = 1;
        //                         //future = getPostList();
        //                       },
        //                     ),
        //                   ).expand(),
        //                 ],
        //               ),
        //             );
        //           },
        //         );
        //       },
        //       icon: cachedImage(appStore.loginAvatarUrl, height: 30, width: 30, fit: BoxFit.cover).cornerRadiusWithClipRRect(15),
        //     ),
        //   ),
        // ],
      ),


      body:
      offering!.isEmpty? Center(
        child: CircularProgressIndicator(),
      ):
      Column(
        children: [

          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context,index){
                  final package=packages![index];
                  final product =package.product;
              return Column(
                children: [
                  // Text(checkingmembership.toString()),


                  Container(
                    decoration: BoxDecoration(
                        color: appStore.isDarkMode?Colors.black:Colors.white,
                        borderRadius: BorderRadius.only(
                          // bottomRight: Radius.circular(20),
                          //   bottomLeft: Radius.circular(50)
                        )
                    ),
                    child:Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(packages![0].product.title.toString(),style: GoogleFonts.montserrat(textStyle: TextStyle(
                                color: appColorPrimary,fontWeight: FontWeight.bold,fontSize: 32
                            )),),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 20),
                          child: Align(
                            alignment: Alignment.topLeft,

                            child: Text(packages![0].product.priceString.toString(),style: GoogleFonts.montserrat(textStyle: TextStyle(
                                color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold,fontSize: 32
                            ))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0,left: 20),
                          child: Align(
                            alignment: Alignment.topLeft,

                            child: Text('(Plus Taxes)',style: GoogleFonts.montserrat(textStyle: TextStyle(
                                color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold,fontSize: 32
                            ))),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top:20,left: 20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: InkWell(
                              onTap: () async {
                                if(checkingmembership == false) {
                                  await PurchaseApi.purchasePackage(
                                      packages![0],
                                      packages![0].product.title.toString(),
                                      context);
                                }
                               // else if(checkingmembership=true) {
                               //    toast('Membership Already Taken', print: true);
                               //  }
                                else{
                                  toast('Membership Already Taken', print: true);
                                }
                                 print('hghvhgv');

                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(255,70,19,1),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5)
                                    )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text('Buy Now',style: GoogleFonts.montserrat(textStyle: TextStyle(
                                      color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15
                                  ))),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top:20,left: 20),
                            child: Text(packages![0].product.description.toString(),style: GoogleFonts.poppins(textStyle: TextStyle(
                                color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w400,fontSize: 19
                            ))),
                          ),
                        ),

                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top:20,left: 20),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(118,178,84,1),
                                      borderRadius: BorderRadius.only(
                                        // bottomRight: Radius.circular(5),
                                        // bottomLeft: Radius.circular(5),
                                        // topLeft: Radius.circular(5),
                                        // topRight: Radius.circular(5)
                                      )
                                  ),
                                  child: Icon(Icons.check,color: Colors.white,),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Annual Membership',style: GoogleFonts.poppins(textStyle: TextStyle(
                                    color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                                ))),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top:20,left: 20),
                            child: Text('12 Months for ₹ 750',style: GoogleFonts.poppins(textStyle: TextStyle(
                                color:appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                            ))),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top:20,left: 20),
                            child: Text('(Including GST)',style: GoogleFonts.poppins(textStyle: TextStyle(
                                color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                            ))),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top:20,left: 20),
                            child: Table(
                              columnWidths: {
                                0:FlexColumnWidth(0.5),
                                1:FlexColumnWidth(5)
                              },
                              children: [
                                TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right:5,top: 5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(118,178,84,1),
                                              borderRadius: BorderRadius.only(
                                                // bottomRight: Radius.circular(5),
                                                // bottomLeft: Radius.circular(5),
                                                // topLeft: Radius.circular(5),
                                                // topRight: Radius.circular(5)
                                              )
                                          ),
                                          child: Icon(Icons.check,color: Colors.white,),
                                        ),
                                      ),

                                      Column(
                                        children: [
                                          Text('Access all/ any Thematic 12 Groups for conversations and collective learning',style: GoogleFonts.poppins(textStyle: TextStyle(
                                              color:  appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                                          ))),
                                        ],
                                      ),
                                    ]
                                )

                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top:20,left: 20),
                            child:


                            Table(
                              columnWidths: {
                                0:FlexColumnWidth(0.5),
                                1:FlexColumnWidth(5)
                              },
                              children: [
                                TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right:5,top: 5),
                                        child:  Container(
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(118,178,84,1),
                                              borderRadius: BorderRadius.only(
                                                // bottomRight: Radius.circular(5),
                                                // bottomLeft: Radius.circular(5),
                                                // topLeft: Radius.circular(5),
                                                // topRight: Radius.circular(5)
                                              )
                                          ),
                                          child: Icon(Icons.check,color: Colors.white,),
                                        ),
                                      ),



                                      Text('Access upto 12 Masterclasses that can be launched from the platform',style: GoogleFonts.poppins(textStyle: TextStyle(
                                          color:appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                                      ))),
                                    ]
                                )

                              ],
                            ),

                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top:20,left: 20),
                            child:
                            Table(
                              columnWidths: {
                                0:FlexColumnWidth(0.5),
                                1:FlexColumnWidth(5)
                              },
                              children: [
                                TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right:5,top: 5),
                                        child:  Container(
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(118,178,84,1),
                                              borderRadius: BorderRadius.only(
                                                // bottomRight: Radius.circular(5),
                                                // bottomLeft: Radius.circular(5),
                                                // topLeft: Radius.circular(5),
                                                // topRight: Radius.circular(5)
                                              )
                                          ),
                                          child: Icon(Icons.check,color: Colors.white,),
                                        ),
                                      ),



                                      Text('Access Lnod Gallery presenting 12 years of Masterclasses',style: GoogleFonts.poppins(textStyle: TextStyle(
                                          color:appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                                      ))),
                                    ]
                                )

                              ],
                            ),


                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top:20,left: 20),
                            child:

                            Table(
                              columnWidths: {
                                0:FlexColumnWidth(0.5),
                                1:FlexColumnWidth(5)
                              },
                              children: [
                                TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right:5,top: 5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(118,178,84,1),
                                              borderRadius: BorderRadius.only(
                                                // bottomRight: Radius.circular(5),
                                                // bottomLeft: Radius.circular(5),
                                                // topLeft: Radius.circular(5),
                                                // topRight: Radius.circular(5)
                                              )
                                          ),
                                          child: Icon(Icons.check,color: Colors.white,),
                                        ),
                                      ),





                                      Text('Use the Learning Universe to buy Learning resources and book your seat for upcoming Lnod Academy programs  and other seminars/ learning opportunities.',style: GoogleFonts.poppins(textStyle: TextStyle(
                                          color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                                      ))),
                                    ]
                                )

                              ],
                            ),

                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top:20,left: 20),
                            child:

                            Table(
                              columnWidths: {
                                0:FlexColumnWidth(0.5),
                                1:FlexColumnWidth(5)
                              },
                              children: [
                                TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right:5,top: 5),
                                        child:  Container(
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(118,178,84,1),
                                              borderRadius: BorderRadius.only(
                                                // bottomRight: Radius.circular(5),
                                                // bottomLeft: Radius.circular(5),
                                                // topLeft: Radius.circular(5),
                                                // topRight: Radius.circular(5)
                                              )
                                          ),
                                          child: Icon(Icons.check,color: Colors.white,),
                                        ),
                                      ),




                                      Text('Access Expert Advisory services from leading Industry Experts and Thought Leaders',style: GoogleFonts.poppins(textStyle: TextStyle(
                                          color:appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                                      ))),
                                    ]
                                )

                              ],
                            ),

                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top:20,left: 20),
                            child:

                            Table(
                              columnWidths: {
                                0:FlexColumnWidth(0.5),
                                1:FlexColumnWidth(5)
                              },
                              children: [
                                TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right:5,top: 5),
                                        child:  Container(
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(118,178,84,1),
                                              borderRadius: BorderRadius.only(
                                                // bottomRight: Radius.circular(5),
                                                // bottomLeft: Radius.circular(5),
                                                // topLeft: Radius.circular(5),
                                                // topRight: Radius.circular(5)
                                              )
                                          ),
                                          child: Icon(Icons.check,color: Colors.white,),
                                        ),
                                      ),


                                      Text('Access Specially curated videos,podcasts and blogs to facilitate your learning.',style: GoogleFonts.poppins(textStyle: TextStyle(
                                          color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                                      ))),
                                    ]
                                )

                              ],
                            ),

                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top:20,left: 20,bottom: 10),
                            child:
                            Table(
                              columnWidths: {
                                0:FlexColumnWidth(0.5),
                                1:FlexColumnWidth(5)
                              },
                              children: [
                                TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right:5,top: 5),
                                        child:  Container(
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(118,178,84,1),
                                              borderRadius: BorderRadius.only(
                                                // bottomRight: Radius.circular(5),
                                                // bottomLeft: Radius.circular(5),
                                                // topLeft: Radius.circular(5),
                                                // topRight: Radius.circular(5)
                                              )
                                          ),
                                          child: Icon(Icons.check,color: Colors.white,),
                                        ),
                                      ),





                                      Text('Lnod Communities Mentoring Board- coming soon..',style: GoogleFonts.poppins(textStyle: TextStyle(
                                          color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                                      ))),
                                    ]
                                )

                              ],
                            ),

                          ),
                        ),
                      ],

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: appStore.isDarkMode?Colors.black:Colors.white,
                          borderRadius: BorderRadius.only(
                            // bottomRight: Radius.circular(20),
                            //   bottomLeft: Radius.circular(50)
                          )
                      ),
                      child:Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10,left: 20),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(packages![1].product.title.toString(),style: GoogleFonts.montserrat(textStyle: TextStyle(
                                  color: appColorPrimary,fontWeight: FontWeight.bold,fontSize: 32
                              )),),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10,left: 20),
                            child: Align(
                              alignment: Alignment.topLeft,

                              child: Text(packages![1].product.priceString.toString(),style: GoogleFonts.montserrat(textStyle: TextStyle(
                                  color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold,fontSize: 32
                              ))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0,left: 20),
                            child: Align(
                              alignment: Alignment.topLeft,

                              child: Text('(Plus Taxes)',style: GoogleFonts.montserrat(textStyle: TextStyle(
                                  color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold,fontSize: 32
                              ))),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top:20,left: 20),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                onTap:() async {
                                  if(checkingmembership == false) {
                                    // print('dgfb');
                                     await PurchaseApi.purchasePackage(packages![1],packages![1].product.title.toString(),context);
                                  }
                                 else {
                                     toast('Membership Already Taken', print: true);
                                  }
                                  // else{
                                  //   // toast('Membership Already Taken', print: true);
                                  // }
                                  print('hghvhgv');

                                      },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255,70,19,1),
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5)
                                      )
                                  ),
                                  child:  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text('Buy Now',style: GoogleFonts.montserrat(textStyle: TextStyle(
                                        color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15
                                    ))),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20,left: 20),
                              child: Text(packages![1].product.description.toString(),style: GoogleFonts.poppins(textStyle: TextStyle(
                                  color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w400,fontSize: 19
                              ))),
                            ),
                          ),

                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20,left: 20),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(118,178,84,1),
                                        borderRadius: BorderRadius.only(
                                          // bottomRight: Radius.circular(5),
                                          // bottomLeft: Radius.circular(5),
                                          // topLeft: Radius.circular(5),
                                          // topRight: Radius.circular(5)
                                        )
                                    ),
                                    child: Icon(Icons.check,color: Colors.white,),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('Annual Membership',style: GoogleFonts.poppins(textStyle: TextStyle(
                                      color:appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                                  ))),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20,left: 20),
                              child: Text('12 Months for ₹ 999',style: GoogleFonts.poppins(textStyle: TextStyle(
                                  color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                              ))),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20,left: 20),
                              child: Text('(Including GST)',style: GoogleFonts.poppins(textStyle: TextStyle(
                                  color:appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                              ))),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20,left: 20),
                              child: Table(
                                columnWidths: {
                                  0:FlexColumnWidth(0.5),
                                  1:FlexColumnWidth(5)
                                },
                                children: [
                                  TableRow(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right:5,top: 5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(118,178,84,1),
                                                borderRadius: BorderRadius.only(
                                                  // bottomRight: Radius.circular(5),
                                                  // bottomLeft: Radius.circular(5),
                                                  // topLeft: Radius.circular(5),
                                                  // topRight: Radius.circular(5)
                                                )
                                            ),
                                            child: Icon(Icons.check,color: Colors.white,),
                                          ),
                                        ),

                                        Column(
                                          children: [
                                            Text('Access all/ any Thematic 12 Groups for conversations and collective learning ',style: GoogleFonts.poppins(textStyle: TextStyle(
                                                color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                                            ))),
                                          ],
                                        ),
                                      ]
                                  )

                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20,left: 20),
                              child:


                              Table(
                                columnWidths: {
                                  0:FlexColumnWidth(0.5),
                                  1:FlexColumnWidth(5)
                                },
                                children: [
                                  TableRow(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right:5,top: 5),
                                          child:  Container(
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(118,178,84,1),
                                                borderRadius: BorderRadius.only(
                                                  // bottomRight: Radius.circular(5),
                                                  // bottomLeft: Radius.circular(5),
                                                  // topLeft: Radius.circular(5),
                                                  // topRight: Radius.circular(5)
                                                )
                                            ),
                                            child: Icon(Icons.check,color: Colors.white,),
                                          ),
                                        ),



                                        Text('Access upto 12 Masterclasses that can be launched from the platform',style: GoogleFonts.poppins(textStyle: TextStyle(
                                            color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                                        ))),
                                      ]
                                  )

                                ],
                              ),

                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20,left: 20),
                              child:
                              Table(
                                columnWidths: {
                                  0:FlexColumnWidth(0.5),
                                  1:FlexColumnWidth(5)
                                },
                                children: [
                                  TableRow(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right:5,top: 5),
                                          child:  Container(
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(118,178,84,1),
                                                borderRadius: BorderRadius.only(
                                                  // bottomRight: Radius.circular(5),
                                                  // bottomLeft: Radius.circular(5),
                                                  // topLeft: Radius.circular(5),
                                                  // topRight: Radius.circular(5)
                                                )
                                            ),
                                            child: Icon(Icons.check,color: Colors.white,),
                                          ),
                                        ),



                                        Text('Access Lnod Gallery presenting 12 years of Masterclasses ',style: GoogleFonts.poppins(textStyle: TextStyle(
                                            color:appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                                        ))),
                                      ]
                                  )

                                ],
                              ),


                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20,left: 20),
                              child:

                              Table(
                                columnWidths: {
                                  0:FlexColumnWidth(0.5),
                                  1:FlexColumnWidth(5)
                                },
                                children: [
                                  TableRow(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right:5,top: 5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(118,178,84,1),
                                                borderRadius: BorderRadius.only(
                                                  // bottomRight: Radius.circular(5),
                                                  // bottomLeft: Radius.circular(5),
                                                  // topLeft: Radius.circular(5),
                                                  // topRight: Radius.circular(5)
                                                )
                                            ),
                                            child: Icon(Icons.check,color: Colors.white,),
                                          ),
                                        ),





                                        Text('Use the Learning Universe to buy Learning resources and book your seat for upcoming Lnod Academy programs and other seminars/ learning opportunities. ',style: GoogleFonts.poppins(textStyle: TextStyle(
                                            color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                                        ))),
                                      ]
                                  )

                                ],
                              ),

                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20,left: 20),
                              child:

                              Table(
                                columnWidths: {
                                  0:FlexColumnWidth(0.5),
                                  1:FlexColumnWidth(5)
                                },
                                children: [
                                  TableRow(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right:5,top: 5),
                                          child:  Container(
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(118,178,84,1),
                                                borderRadius: BorderRadius.only(
                                                  // bottomRight: Radius.circular(5),
                                                  // bottomLeft: Radius.circular(5),
                                                  // topLeft: Radius.circular(5),
                                                  // topRight: Radius.circular(5)
                                                )
                                            ),
                                            child: Icon(Icons.check,color: Colors.white,),
                                          ),
                                        ),




                                        Text('Access Expert Advisory services from leading Industry Experts and Thought Leaders.',style: GoogleFonts.poppins(textStyle: TextStyle(
                                            color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                                        ))),
                                      ]
                                  )

                                ],
                              ),

                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20,left: 20),
                              child:

                              Table(
                                columnWidths: {
                                  0:FlexColumnWidth(0.5),
                                  1:FlexColumnWidth(5)
                                },
                                children: [
                                  TableRow(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right:5,top: 5),
                                          child:  Container(
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(118,178,84,1),
                                                borderRadius: BorderRadius.only(
                                                  // bottomRight: Radius.circular(5),
                                                  // bottomLeft: Radius.circular(5),
                                                  // topLeft: Radius.circular(5),
                                                  // topRight: Radius.circular(5)
                                                )
                                            ),
                                            child: Icon(Icons.check,color: Colors.white,),
                                          ),
                                        ),


                                        Text('Access Specially curated videos,podcasts and blogs to facilitate your learning.',style: GoogleFonts.poppins(textStyle: TextStyle(
                                            color:appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                                        ))),
                                      ]
                                  )

                                ],
                              ),

                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20,left: 20,bottom: 10),
                              child:
                              Table(
                                columnWidths: {
                                  0:FlexColumnWidth(0.5),
                                  1:FlexColumnWidth(5)
                                },
                                children: [
                                  TableRow(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right:5,top: 5),
                                          child:  Container(
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(118,178,84,1),
                                                borderRadius: BorderRadius.only(
                                                  // bottomRight: Radius.circular(5),
                                                  // bottomLeft: Radius.circular(5),
                                                  // topLeft: Radius.circular(5),
                                                  // topRight: Radius.circular(5)
                                                )
                                            ),
                                            child: Icon(Icons.check,color: Colors.white,),
                                          ),
                                        ),





                                        Text('Lnod Communities Mentoring Board- coming soon..',style: GoogleFonts.poppins(textStyle: TextStyle(
                                            color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                                        ))),
                                      ]
                                  )

                                ],
                              ),

                            ),
                          ),
                        ],

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: appStore.isDarkMode?Colors.black:Colors.white,
                          borderRadius: BorderRadius.only(
                            // bottomRight: Radius.circular(20),
                            //   bottomLeft: Radius.circular(50)
                          )
                      ),
                      child:Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10,left: 20),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text("Corporate Membership",style: GoogleFonts.montserrat(textStyle: TextStyle(
                                  color: appColorPrimary,fontWeight: FontWeight.bold,fontSize: 32
                              )),),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10,left: 20),
                            child: Align(
                              alignment: Alignment.topLeft,

                              child: Text("Contact",style: GoogleFonts.montserrat(textStyle: TextStyle(
                                  color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold,fontSize: 32
                              ))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0,left: 20),
                            child: Align(
                              alignment: Alignment.topLeft,

                              child: Text('Team',style: GoogleFonts.montserrat(textStyle: TextStyle(
                                  color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold,fontSize: 32
                              ))),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top:20,left: 20),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                onTap:() async {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Corporatemembership()));
                                  // await PurchaseApi.purchasePackage(packages![1],packages![0].product.title.toString());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255,70,19,1),
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5)
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text('Contact Now',style: GoogleFonts.montserrat(textStyle: TextStyle(
                                        color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15
                                    ))),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20,left: 20),
                              child: Text("(Rs.900 per Membership for minimum 10 members)",style: GoogleFonts.poppins(textStyle: TextStyle(
                                  color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w400,fontSize: 19
                              ))),
                            ),
                          ),


                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20,left: 20),
                              child: Table(
                                columnWidths: {
                                  0:FlexColumnWidth(0.5),
                                  1:FlexColumnWidth(5)
                                },
                                children: [
                                  TableRow(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right:5,top: 5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(118,178,84,1),
                                                borderRadius: BorderRadius.only(
                                                  // bottomRight: Radius.circular(5),
                                                  // bottomLeft: Radius.circular(5),
                                                  // topLeft: Radius.circular(5),
                                                  // topRight: Radius.circular(5)
                                                )
                                            ),
                                            child: Icon(Icons.check,color: Colors.white,),
                                          ),
                                        ),

                                        Column(
                                          children: [
                                            Text('Annual Membership valid for minimum 10 individual members and more. ',style: GoogleFonts.poppins(textStyle: TextStyle(
                                                color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                                            ))),
                                          ],
                                        ),
                                      ]
                                  )

                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20,left: 20),
                              child: Table(
                                columnWidths: {
                                  0:FlexColumnWidth(0.5),
                                  1:FlexColumnWidth(5)
                                },
                                children: [
                                  TableRow(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right:5,top: 5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(118,178,84,1),
                                                borderRadius: BorderRadius.only(
                                                  // bottomRight: Radius.circular(5),
                                                  // bottomLeft: Radius.circular(5),
                                                  // topLeft: Radius.circular(5),
                                                  // topRight: Radius.circular(5)
                                                )
                                            ),
                                            child: Icon(Icons.check,color: Colors.white,),
                                          ),
                                        ),

                                        Column(
                                          children: [
                                            Text('Annual Seminars and other paid Live Events @30% off. ',style: GoogleFonts.poppins(textStyle: TextStyle(
                                                color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                                            ))),
                                          ],
                                        ),
                                      ]
                                  )

                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20,left: 20),
                              child:


                              Table(
                                columnWidths: {
                                  0:FlexColumnWidth(0.5),
                                  1:FlexColumnWidth(5)
                                },
                                children: [
                                  TableRow(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right:5,top: 5),
                                          child:  Container(
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(118,178,84,1),
                                                borderRadius: BorderRadius.only(
                                                  // bottomRight: Radius.circular(5),
                                                  // bottomLeft: Radius.circular(5),
                                                  // topLeft: Radius.circular(5),
                                                  // topRight: Radius.circular(5)
                                                )
                                            ),
                                            child: Icon(Icons.check,color: Colors.white,),
                                          ),
                                        ),



                                        Text('Access Platform Link for your colleagues on LMS @Rs 750 for 100+ members',style: GoogleFonts.poppins(textStyle: TextStyle(
                                            color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                                        ))),
                                      ]
                                  )

                                ],
                              ),

                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20,left: 20),
                              child:
                              Table(
                                columnWidths: {
                                  0:FlexColumnWidth(0.5),
                                  1:FlexColumnWidth(5)
                                },
                                children: [
                                  TableRow(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right:5,top: 5),
                                          child:  Container(
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(118,178,84,1),
                                                borderRadius: BorderRadius.only(
                                                  // bottomRight: Radius.circular(5),
                                                  // bottomLeft: Radius.circular(5),
                                                  // topLeft: Radius.circular(5),
                                                  // topRight: Radius.circular(5)
                                                )
                                            ),
                                            child: Icon(Icons.check,color: Colors.white,),
                                          ),
                                        ),



                                        Text('Launch one or more Live topical Masterclasses every Month (Launched directly from our platform) ',style: GoogleFonts.poppins(textStyle: TextStyle(
                                            color:appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                                        ))),
                                      ]
                                  )

                                ],
                              ),


                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20,left: 20),
                              child:

                              Table(
                                columnWidths: {
                                  0:FlexColumnWidth(0.5),
                                  1:FlexColumnWidth(5)
                                },
                                children: [
                                  TableRow(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right:5,top: 5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(118,178,84,1),
                                                borderRadius: BorderRadius.only(
                                                  // bottomRight: Radius.circular(5),
                                                  // bottomLeft: Radius.circular(5),
                                                  // topLeft: Radius.circular(5),
                                                  // topRight: Radius.circular(5)
                                                )
                                            ),
                                            child: Icon(Icons.check,color: Colors.white,),
                                          ),
                                        ),





                                        Text('Access World class LNOD Academy Programs at 25% off ',style: GoogleFonts.poppins(textStyle: TextStyle(
                                            color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                                        ))),
                                      ]
                                  )

                                ],
                              ),

                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20,left: 20),
                              child:

                              Table(
                                columnWidths: {
                                  0:FlexColumnWidth(0.5),
                                  1:FlexColumnWidth(5)
                                },
                                children: [
                                  TableRow(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right:5,top: 5),
                                          child:  Container(
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(118,178,84,1),
                                                borderRadius: BorderRadius.only(
                                                  // bottomRight: Radius.circular(5),
                                                  // bottomLeft: Radius.circular(5),
                                                  // topLeft: Radius.circular(5),
                                                  // topRight: Radius.circular(5)
                                                )
                                            ),
                                            child: Icon(Icons.check,color: Colors.white,),
                                          ),
                                        ),




                                        Text('Avail Free courses and videos ',style: GoogleFonts.poppins(textStyle: TextStyle(
                                            color: appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                                        ))),
                                      ]
                                  )

                                ],
                              ),

                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20,left: 20),
                              child:

                              Table(
                                columnWidths: {
                                  0:FlexColumnWidth(0.5),
                                  1:FlexColumnWidth(5)
                                },
                                children: [
                                  TableRow(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right:5,top: 5),
                                          child:  Container(
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(118,178,84,1),
                                                borderRadius: BorderRadius.only(
                                                  // bottomRight: Radius.circular(5),
                                                  // bottomLeft: Radius.circular(5),
                                                  // topLeft: Radius.circular(5),
                                                  // topRight: Radius.circular(5)
                                                )
                                            ),
                                            child: Icon(Icons.check,color: Colors.white,),
                                          ),
                                        ),


                                        Text('Look for Special Offers for LNOD Roundtable members on The Learning Universe products and services ',style: GoogleFonts.poppins(textStyle: TextStyle(
                                            color:appStore.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w300,fontSize: 19
                                        ))),
                                      ]
                                  )

                                ],
                              ),

                            ),
                          ),

                        ],

                      ),
                    ),
                  ),
                  // Text(packages![0].product.title.toString()),
                  // Text(packages![1].product.title.toString()),
                ],
              );
            }),
          )
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
          // Container(
          //   decoration: BoxDecoration(
          //       color: Color.fromRGBO(9,46,86,1),
          //       borderRadius: BorderRadius.only(
          //         // bottomRight: Radius.circular(20),
          //         //   bottomLeft: Radius.circular(50)
          //       )
          //   ),
          //   child:Column(
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.only(top: 10,left: 20),
          //         child: Align(
          //           alignment: Alignment.topLeft,
          //           child: Text('Students Membership',style: GoogleFonts.montserrat(textStyle: TextStyle(
          //               color: Colors.white,fontWeight: FontWeight.bold,fontSize: 32
          //           )),),
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(top: 10,left: 20),
          //         child: Align(
          //           alignment: Alignment.topLeft,
          //
          //           child: Text('Rs 750/- ',style: GoogleFonts.montserrat(textStyle: TextStyle(
          //               color: Color.fromRGBO(250,193,0,1),fontWeight: FontWeight.bold,fontSize: 32
          //           ))),
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(top: 0,left: 20),
          //         child: Align(
          //           alignment: Alignment.topLeft,
          //
          //           child: Text('(Plus Taxes)',style: GoogleFonts.montserrat(textStyle: TextStyle(
          //               color: Color.fromRGBO(250,193,0,1),fontWeight: FontWeight.bold,fontSize: 32
          //           ))),
          //         ),
          //       ),
          //
          //       Padding(
          //         padding: const EdgeInsets.only(top:20,left: 20),
          //         child: Align(
          //           alignment: Alignment.topLeft,
          //           child: InkWell(
          //             onTap: (){
          //               fetctOffers();
          //               print('hghvhgv');
          //
          //             },
          //             child: Container(
          //               decoration: BoxDecoration(
          //                   color: Color.fromRGBO(255,70,19,1),
          //                   borderRadius: BorderRadius.only(
          //                       bottomRight: Radius.circular(5),
          //                       bottomLeft: Radius.circular(5),
          //                       topLeft: Radius.circular(5),
          //                       topRight: Radius.circular(5)
          //                   )
          //               ),
          //               child: Padding(
          //                 padding: const EdgeInsets.all(16.0),
          //                 child: Text('Buy Now',style: GoogleFonts.montserrat(textStyle: TextStyle(
          //                     color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15
          //                 ))),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //       Align(
          //         alignment: Alignment.topLeft,
          //         child: Padding(
          //           padding: const EdgeInsets.only(top:20,left: 20),
          //           child: Text('(Annual Membership valid Only for students)**',style: GoogleFonts.poppins(textStyle: TextStyle(
          //               color: Colors.white,fontWeight: FontWeight.w400,fontSize: 19
          //           ))),
          //         ),
          //       ),
          //
          //       Align(
          //         alignment: Alignment.topLeft,
          //         child: Padding(
          //           padding: const EdgeInsets.only(top:20,left: 20),
          //           child: Row(
          //             children: [
          //               Container(
          //                 decoration: BoxDecoration(
          //                     color: Color.fromRGBO(118,178,84,1),
          //                     borderRadius: BorderRadius.only(
          //                       // bottomRight: Radius.circular(5),
          //                       // bottomLeft: Radius.circular(5),
          //                       // topLeft: Radius.circular(5),
          //                       // topRight: Radius.circular(5)
          //                     )
          //                 ),
          //                 child: Icon(Icons.check,color: Colors.white,),
          //               ),
          //               SizedBox(
          //                 width: 10,
          //               ),
          //               Text('Annual Membership',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                   color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //               ))),
          //             ],
          //           ),
          //         ),
          //       ),
          //       Align(
          //         alignment: Alignment.topLeft,
          //         child: Padding(
          //           padding: const EdgeInsets.only(top:20,left: 20),
          //           child: Text('12 Months for ₹ 750',style: GoogleFonts.poppins(textStyle: TextStyle(
          //               color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //           ))),
          //         ),
          //       ),
          //       Align(
          //         alignment: Alignment.topLeft,
          //         child: Padding(
          //           padding: const EdgeInsets.only(top:20,left: 20),
          //           child: Text('(Including GST)',style: GoogleFonts.poppins(textStyle: TextStyle(
          //               color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //           ))),
          //         ),
          //       ),
          //       Align(
          //         alignment: Alignment.topLeft,
          //         child: Padding(
          //           padding: const EdgeInsets.only(top:20,left: 20),
          //           child: Table(
          //             columnWidths: {
          //               0:FlexColumnWidth(0.5),
          //               1:FlexColumnWidth(5)
          //             },
          //             children: [
          //               TableRow(
          //                   children: [
          //                     Padding(
          //                       padding: const EdgeInsets.only(right:5,top: 5),
          //                       child: Container(
          //                         decoration: BoxDecoration(
          //                             color: Color.fromRGBO(118,178,84,1),
          //                             borderRadius: BorderRadius.only(
          //                               // bottomRight: Radius.circular(5),
          //                               // bottomLeft: Radius.circular(5),
          //                               // topLeft: Radius.circular(5),
          //                               // topRight: Radius.circular(5)
          //                             )
          //                         ),
          //                         child: Icon(Icons.check,color: Colors.white,),
          //                       ),
          //                     ),
          //
          //                     Column(
          //                       children: [
          //                         Text('Access all/ any Thematic 12 Groups for conversations and collective learning',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                             color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //                         ))),
          //                       ],
          //                     ),
          //                   ]
          //               )
          //
          //             ],
          //           ),
          //         ),
          //       ),
          //       Align(
          //         alignment: Alignment.topLeft,
          //         child: Padding(
          //           padding: const EdgeInsets.only(top:20,left: 20),
          //           child:
          //
          //
          //           Table(
          //             columnWidths: {
          //               0:FlexColumnWidth(0.5),
          //               1:FlexColumnWidth(5)
          //             },
          //             children: [
          //               TableRow(
          //                   children: [
          //                     Padding(
          //                       padding: const EdgeInsets.only(right:5,top: 5),
          //                       child:  Container(
          //                         decoration: BoxDecoration(
          //                             color: Color.fromRGBO(118,178,84,1),
          //                             borderRadius: BorderRadius.only(
          //                               // bottomRight: Radius.circular(5),
          //                               // bottomLeft: Radius.circular(5),
          //                               // topLeft: Radius.circular(5),
          //                               // topRight: Radius.circular(5)
          //                             )
          //                         ),
          //                         child: Icon(Icons.check,color: Colors.white,),
          //                       ),
          //                     ),
          //
          //
          //
          //                     Text('Access upto 12 Masterclasses that can be launched from the platform',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                         color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //                     ))),
          //                   ]
          //               )
          //
          //             ],
          //           ),
          //
          //         ),
          //       ),
          //       Align(
          //         alignment: Alignment.topLeft,
          //         child: Padding(
          //           padding: const EdgeInsets.only(top:20,left: 20),
          //           child:
          //           Table(
          //             columnWidths: {
          //               0:FlexColumnWidth(0.5),
          //               1:FlexColumnWidth(5)
          //             },
          //             children: [
          //               TableRow(
          //                   children: [
          //                     Padding(
          //                       padding: const EdgeInsets.only(right:5,top: 5),
          //                       child:  Container(
          //                         decoration: BoxDecoration(
          //                             color: Color.fromRGBO(118,178,84,1),
          //                             borderRadius: BorderRadius.only(
          //                               // bottomRight: Radius.circular(5),
          //                               // bottomLeft: Radius.circular(5),
          //                               // topLeft: Radius.circular(5),
          //                               // topRight: Radius.circular(5)
          //                             )
          //                         ),
          //                         child: Icon(Icons.check,color: Colors.white,),
          //                       ),
          //                     ),
          //
          //
          //
          //                     Text('Access Lnod Gallery presenting 12 years of Masterclasses',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                         color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //                     ))),
          //                   ]
          //               )
          //
          //             ],
          //           ),
          //
          //
          //         ),
          //       ),
          //       Align(
          //         alignment: Alignment.topLeft,
          //         child: Padding(
          //           padding: const EdgeInsets.only(top:20,left: 20),
          //           child:
          //
          //           Table(
          //             columnWidths: {
          //               0:FlexColumnWidth(0.5),
          //               1:FlexColumnWidth(5)
          //             },
          //             children: [
          //               TableRow(
          //                   children: [
          //                     Padding(
          //                       padding: const EdgeInsets.only(right:5,top: 5),
          //                       child: Container(
          //                         decoration: BoxDecoration(
          //                             color: Color.fromRGBO(118,178,84,1),
          //                             borderRadius: BorderRadius.only(
          //                               // bottomRight: Radius.circular(5),
          //                               // bottomLeft: Radius.circular(5),
          //                               // topLeft: Radius.circular(5),
          //                               // topRight: Radius.circular(5)
          //                             )
          //                         ),
          //                         child: Icon(Icons.check,color: Colors.white,),
          //                       ),
          //                     ),
          //
          //
          //
          //
          //
          //                     Text('Use the Learning Universe to buy Learning resources and book your seat for upcoming Lnod Academy programs  and other seminars/ learning opportunities.',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                         color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //                     ))),
          //                   ]
          //               )
          //
          //             ],
          //           ),
          //
          //         ),
          //       ),
          //       Align(
          //         alignment: Alignment.topLeft,
          //         child: Padding(
          //           padding: const EdgeInsets.only(top:20,left: 20),
          //           child:
          //
          //           Table(
          //             columnWidths: {
          //               0:FlexColumnWidth(0.5),
          //               1:FlexColumnWidth(5)
          //             },
          //             children: [
          //               TableRow(
          //                   children: [
          //                     Padding(
          //                       padding: const EdgeInsets.only(right:5,top: 5),
          //                       child:  Container(
          //                         decoration: BoxDecoration(
          //                             color: Color.fromRGBO(118,178,84,1),
          //                             borderRadius: BorderRadius.only(
          //                               // bottomRight: Radius.circular(5),
          //                               // bottomLeft: Radius.circular(5),
          //                               // topLeft: Radius.circular(5),
          //                               // topRight: Radius.circular(5)
          //                             )
          //                         ),
          //                         child: Icon(Icons.check,color: Colors.white,),
          //                       ),
          //                     ),
          //
          //
          //
          //
          //                     Text('Access Expert Advisory services from leading Industry Experts and Thought Leaders',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                         color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //                     ))),
          //                   ]
          //               )
          //
          //             ],
          //           ),
          //
          //         ),
          //       ),
          //       Align(
          //         alignment: Alignment.topLeft,
          //         child: Padding(
          //           padding: const EdgeInsets.only(top:20,left: 20),
          //           child:
          //
          //           Table(
          //             columnWidths: {
          //               0:FlexColumnWidth(0.5),
          //               1:FlexColumnWidth(5)
          //             },
          //             children: [
          //               TableRow(
          //                   children: [
          //                     Padding(
          //                       padding: const EdgeInsets.only(right:5,top: 5),
          //                       child:  Container(
          //                         decoration: BoxDecoration(
          //                             color: Color.fromRGBO(118,178,84,1),
          //                             borderRadius: BorderRadius.only(
          //                               // bottomRight: Radius.circular(5),
          //                               // bottomLeft: Radius.circular(5),
          //                               // topLeft: Radius.circular(5),
          //                               // topRight: Radius.circular(5)
          //                             )
          //                         ),
          //                         child: Icon(Icons.check,color: Colors.white,),
          //                       ),
          //                     ),
          //
          //
          //                     Text('Access Specially curated videos,podcasts and blogs to facilitate your learning.',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                         color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //                     ))),
          //                   ]
          //               )
          //
          //             ],
          //           ),
          //
          //         ),
          //       ),
          //       Align(
          //         alignment: Alignment.topLeft,
          //         child: Padding(
          //           padding: const EdgeInsets.only(top:20,left: 20,bottom: 10),
          //           child:
          //           Table(
          //             columnWidths: {
          //               0:FlexColumnWidth(0.5),
          //               1:FlexColumnWidth(5)
          //             },
          //             children: [
          //               TableRow(
          //                   children: [
          //                     Padding(
          //                       padding: const EdgeInsets.only(right:5,top: 5),
          //                       child:  Container(
          //                         decoration: BoxDecoration(
          //                             color: Color.fromRGBO(118,178,84,1),
          //                             borderRadius: BorderRadius.only(
          //                               // bottomRight: Radius.circular(5),
          //                               // bottomLeft: Radius.circular(5),
          //                               // topLeft: Radius.circular(5),
          //                               // topRight: Radius.circular(5)
          //                             )
          //                         ),
          //                         child: Icon(Icons.check,color: Colors.white,),
          //                       ),
          //                     ),
          //
          //
          //
          //
          //
          //                     Text('Lnod Communities Mentoring Board- coming soon..',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                         color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //                     ))),
          //                   ]
          //               )
          //
          //             ],
          //           ),
          //
          //         ),
          //       ),
          //     ],
          //
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 10),
          //   child: Container(
          //     decoration: BoxDecoration(
          //         color: Color.fromRGBO(9,46,86,1),
          //         borderRadius: BorderRadius.only(
          //           // bottomRight: Radius.circular(20),
          //           //   bottomLeft: Radius.circular(50)
          //         )
          //     ),
          //     child:Column(
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.only(top: 10,left: 20),
          //           child: Align(
          //             alignment: Alignment.topLeft,
          //             child: Text('Individual Membership',style: GoogleFonts.montserrat(textStyle: TextStyle(
          //                 color: Colors.white,fontWeight: FontWeight.bold,fontSize: 32
          //             )),),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.only(top: 10,left: 20),
          //           child: Align(
          //             alignment: Alignment.topLeft,
          //
          //             child: Text('Rs 999/- ',style: GoogleFonts.montserrat(textStyle: TextStyle(
          //                 color: Color.fromRGBO(250,193,0,1),fontWeight: FontWeight.bold,fontSize: 32
          //             ))),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.only(top: 0,left: 20),
          //           child: Align(
          //             alignment: Alignment.topLeft,
          //
          //             child: Text('(Plus Taxes)',style: GoogleFonts.montserrat(textStyle: TextStyle(
          //                 color: Color.fromRGBO(250,193,0,1),fontWeight: FontWeight.bold,fontSize: 32
          //             ))),
          //           ),
          //         ),
          //
          //         Padding(
          //           padding: const EdgeInsets.only(top:20,left: 20),
          //           child: Align(
          //             alignment: Alignment.topLeft,
          //             child: Container(
          //               decoration: BoxDecoration(
          //                   color: Color.fromRGBO(255,70,19,1),
          //                   borderRadius: BorderRadius.only(
          //                       bottomRight: Radius.circular(5),
          //                       bottomLeft: Radius.circular(5),
          //                       topLeft: Radius.circular(5),
          //                       topRight: Radius.circular(5)
          //                   )
          //               ),
          //               child: Padding(
          //                 padding: const EdgeInsets.all(16.0),
          //                 child: Text('Buy Now',style: GoogleFonts.montserrat(textStyle: TextStyle(
          //                     color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15
          //                 ))),
          //               ),
          //             ),
          //           ),
          //         ),
          //         Align(
          //           alignment: Alignment.topLeft,
          //           child: Padding(
          //             padding: const EdgeInsets.only(top:20,left: 20),
          //             child: Text('(Annual Membership)',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                 color: Colors.white,fontWeight: FontWeight.w400,fontSize: 19
          //             ))),
          //           ),
          //         ),
          //
          //         Align(
          //           alignment: Alignment.topLeft,
          //           child: Padding(
          //             padding: const EdgeInsets.only(top:20,left: 20),
          //             child: Row(
          //               children: [
          //                 Container(
          //                   decoration: BoxDecoration(
          //                       color: Color.fromRGBO(118,178,84,1),
          //                       borderRadius: BorderRadius.only(
          //                         // bottomRight: Radius.circular(5),
          //                         // bottomLeft: Radius.circular(5),
          //                         // topLeft: Radius.circular(5),
          //                         // topRight: Radius.circular(5)
          //                       )
          //                   ),
          //                   child: Icon(Icons.check,color: Colors.white,),
          //                 ),
          //                 SizedBox(
          //                   width: 10,
          //                 ),
          //                 Text('Annual Membership',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                     color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //                 ))),
          //               ],
          //             ),
          //           ),
          //         ),
          //         Align(
          //           alignment: Alignment.topLeft,
          //           child: Padding(
          //             padding: const EdgeInsets.only(top:20,left: 20),
          //             child: Text('12 Months for ₹ 999',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                 color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //             ))),
          //           ),
          //         ),
          //         Align(
          //           alignment: Alignment.topLeft,
          //           child: Padding(
          //             padding: const EdgeInsets.only(top:20,left: 20),
          //             child: Text('(Including GST)',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                 color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //             ))),
          //           ),
          //         ),
          //         Align(
          //           alignment: Alignment.topLeft,
          //           child: Padding(
          //             padding: const EdgeInsets.only(top:20,left: 20),
          //             child: Table(
          //               columnWidths: {
          //                 0:FlexColumnWidth(0.5),
          //                 1:FlexColumnWidth(5)
          //               },
          //               children: [
          //                 TableRow(
          //                     children: [
          //                       Padding(
          //                         padding: const EdgeInsets.only(right:5,top: 5),
          //                         child: Container(
          //                           decoration: BoxDecoration(
          //                               color: Color.fromRGBO(118,178,84,1),
          //                               borderRadius: BorderRadius.only(
          //                                 // bottomRight: Radius.circular(5),
          //                                 // bottomLeft: Radius.circular(5),
          //                                 // topLeft: Radius.circular(5),
          //                                 // topRight: Radius.circular(5)
          //                               )
          //                           ),
          //                           child: Icon(Icons.check,color: Colors.white,),
          //                         ),
          //                       ),
          //
          //                       Column(
          //                         children: [
          //                           Text('Access all/ any Thematic 12 Groups for conversations and collective learning ',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                               color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //                           ))),
          //                         ],
          //                       ),
          //                     ]
          //                 )
          //
          //               ],
          //             ),
          //           ),
          //         ),
          //         Align(
          //           alignment: Alignment.topLeft,
          //           child: Padding(
          //             padding: const EdgeInsets.only(top:20,left: 20),
          //             child:
          //
          //
          //             Table(
          //               columnWidths: {
          //                 0:FlexColumnWidth(0.5),
          //                 1:FlexColumnWidth(5)
          //               },
          //               children: [
          //                 TableRow(
          //                     children: [
          //                       Padding(
          //                         padding: const EdgeInsets.only(right:5,top: 5),
          //                         child:  Container(
          //                           decoration: BoxDecoration(
          //                               color: Color.fromRGBO(118,178,84,1),
          //                               borderRadius: BorderRadius.only(
          //                                 // bottomRight: Radius.circular(5),
          //                                 // bottomLeft: Radius.circular(5),
          //                                 // topLeft: Radius.circular(5),
          //                                 // topRight: Radius.circular(5)
          //                               )
          //                           ),
          //                           child: Icon(Icons.check,color: Colors.white,),
          //                         ),
          //                       ),
          //
          //
          //
          //                       Text('Access upto 12 Masterclasses that can be launched from the platform',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                           color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //                       ))),
          //                     ]
          //                 )
          //
          //               ],
          //             ),
          //
          //           ),
          //         ),
          //         Align(
          //           alignment: Alignment.topLeft,
          //           child: Padding(
          //             padding: const EdgeInsets.only(top:20,left: 20),
          //             child:
          //             Table(
          //               columnWidths: {
          //                 0:FlexColumnWidth(0.5),
          //                 1:FlexColumnWidth(5)
          //               },
          //               children: [
          //                 TableRow(
          //                     children: [
          //                       Padding(
          //                         padding: const EdgeInsets.only(right:5,top: 5),
          //                         child:  Container(
          //                           decoration: BoxDecoration(
          //                               color: Color.fromRGBO(118,178,84,1),
          //                               borderRadius: BorderRadius.only(
          //                                 // bottomRight: Radius.circular(5),
          //                                 // bottomLeft: Radius.circular(5),
          //                                 // topLeft: Radius.circular(5),
          //                                 // topRight: Radius.circular(5)
          //                               )
          //                           ),
          //                           child: Icon(Icons.check,color: Colors.white,),
          //                         ),
          //                       ),
          //
          //
          //
          //                       Text('Access Lnod Gallery presenting 12 years of Masterclasses ',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                           color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //                       ))),
          //                     ]
          //                 )
          //
          //               ],
          //             ),
          //
          //
          //           ),
          //         ),
          //         Align(
          //           alignment: Alignment.topLeft,
          //           child: Padding(
          //             padding: const EdgeInsets.only(top:20,left: 20),
          //             child:
          //
          //             Table(
          //               columnWidths: {
          //                 0:FlexColumnWidth(0.5),
          //                 1:FlexColumnWidth(5)
          //               },
          //               children: [
          //                 TableRow(
          //                     children: [
          //                       Padding(
          //                         padding: const EdgeInsets.only(right:5,top: 5),
          //                         child: Container(
          //                           decoration: BoxDecoration(
          //                               color: Color.fromRGBO(118,178,84,1),
          //                               borderRadius: BorderRadius.only(
          //                                 // bottomRight: Radius.circular(5),
          //                                 // bottomLeft: Radius.circular(5),
          //                                 // topLeft: Radius.circular(5),
          //                                 // topRight: Radius.circular(5)
          //                               )
          //                           ),
          //                           child: Icon(Icons.check,color: Colors.white,),
          //                         ),
          //                       ),
          //
          //
          //
          //
          //
          //                       Text('Use the Learning Universe to buy Learning resources and book your seat for upcoming Lnod Academy programs and other seminars/ learning opportunities. ',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                           color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //                       ))),
          //                     ]
          //                 )
          //
          //               ],
          //             ),
          //
          //           ),
          //         ),
          //         Align(
          //           alignment: Alignment.topLeft,
          //           child: Padding(
          //             padding: const EdgeInsets.only(top:20,left: 20),
          //             child:
          //
          //             Table(
          //               columnWidths: {
          //                 0:FlexColumnWidth(0.5),
          //                 1:FlexColumnWidth(5)
          //               },
          //               children: [
          //                 TableRow(
          //                     children: [
          //                       Padding(
          //                         padding: const EdgeInsets.only(right:5,top: 5),
          //                         child:  Container(
          //                           decoration: BoxDecoration(
          //                               color: Color.fromRGBO(118,178,84,1),
          //                               borderRadius: BorderRadius.only(
          //                                 // bottomRight: Radius.circular(5),
          //                                 // bottomLeft: Radius.circular(5),
          //                                 // topLeft: Radius.circular(5),
          //                                 // topRight: Radius.circular(5)
          //                               )
          //                           ),
          //                           child: Icon(Icons.check,color: Colors.white,),
          //                         ),
          //                       ),
          //
          //
          //
          //
          //                       Text('Access Expert Advisory services from leading Industry Experts and Thought Leaders.',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                           color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //                       ))),
          //                     ]
          //                 )
          //
          //               ],
          //             ),
          //
          //           ),
          //         ),
          //         Align(
          //           alignment: Alignment.topLeft,
          //           child: Padding(
          //             padding: const EdgeInsets.only(top:20,left: 20),
          //             child:
          //
          //             Table(
          //               columnWidths: {
          //                 0:FlexColumnWidth(0.5),
          //                 1:FlexColumnWidth(5)
          //               },
          //               children: [
          //                 TableRow(
          //                     children: [
          //                       Padding(
          //                         padding: const EdgeInsets.only(right:5,top: 5),
          //                         child:  Container(
          //                           decoration: BoxDecoration(
          //                               color: Color.fromRGBO(118,178,84,1),
          //                               borderRadius: BorderRadius.only(
          //                                 // bottomRight: Radius.circular(5),
          //                                 // bottomLeft: Radius.circular(5),
          //                                 // topLeft: Radius.circular(5),
          //                                 // topRight: Radius.circular(5)
          //                               )
          //                           ),
          //                           child: Icon(Icons.check,color: Colors.white,),
          //                         ),
          //                       ),
          //
          //
          //                       Text('Access Specially curated videos,podcasts and blogs to facilitate your learning.',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                           color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //                       ))),
          //                     ]
          //                 )
          //
          //               ],
          //             ),
          //
          //           ),
          //         ),
          //         Align(
          //           alignment: Alignment.topLeft,
          //           child: Padding(
          //             padding: const EdgeInsets.only(top:20,left: 20,bottom: 10),
          //             child:
          //             Table(
          //               columnWidths: {
          //                 0:FlexColumnWidth(0.5),
          //                 1:FlexColumnWidth(5)
          //               },
          //               children: [
          //                 TableRow(
          //                     children: [
          //                       Padding(
          //                         padding: const EdgeInsets.only(right:5,top: 5),
          //                         child:  Container(
          //                           decoration: BoxDecoration(
          //                               color: Color.fromRGBO(118,178,84,1),
          //                               borderRadius: BorderRadius.only(
          //                                 // bottomRight: Radius.circular(5),
          //                                 // bottomLeft: Radius.circular(5),
          //                                 // topLeft: Radius.circular(5),
          //                                 // topRight: Radius.circular(5)
          //                               )
          //                           ),
          //                           child: Icon(Icons.check,color: Colors.white,),
          //                         ),
          //                       ),
          //
          //
          //
          //
          //
          //                       Text('Lnod Communities Mentoring Board- coming soon..',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                           color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //                       ))),
          //                     ]
          //                 )
          //
          //               ],
          //             ),
          //
          //           ),
          //         ),
          //       ],
          //
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 10),
          //   child: Container(
          //     decoration: BoxDecoration(
          //         color: Color.fromRGBO(9,46,86,1),
          //         borderRadius: BorderRadius.only(
          //           // bottomRight: Radius.circular(20),
          //           //   bottomLeft: Radius.circular(50)
          //         )
          //     ),
          //     child:Column(
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.only(top: 10,left: 20),
          //           child: Align(
          //             alignment: Alignment.topLeft,
          //             child: Text('Corporate Membership',style: GoogleFonts.montserrat(textStyle: TextStyle(
          //                 color: Colors.white,fontWeight: FontWeight.bold,fontSize: 32
          //             )),),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.only(top: 10,left: 20),
          //           child: Align(
          //             alignment: Alignment.topLeft,
          //
          //             child: Text('Contact',style: GoogleFonts.montserrat(textStyle: TextStyle(
          //                 color: Color.fromRGBO(250,193,0,1),fontWeight: FontWeight.bold,fontSize: 32
          //             ))),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.only(top: 0,left: 20),
          //           child: Align(
          //             alignment: Alignment.topLeft,
          //
          //             child: Text('Team',style: GoogleFonts.montserrat(textStyle: TextStyle(
          //                 color: Color.fromRGBO(250,193,0,1),fontWeight: FontWeight.bold,fontSize: 32
          //             ))),
          //           ),
          //         ),
          //
          //         Padding(
          //           padding: const EdgeInsets.only(top:20,left: 20),
          //           child: Align(
          //             alignment: Alignment.topLeft,
          //             child: Container(
          //               decoration: BoxDecoration(
          //                   color: Color.fromRGBO(255,70,19,1),
          //                   borderRadius: BorderRadius.only(
          //                       bottomRight: Radius.circular(5),
          //                       bottomLeft: Radius.circular(5),
          //                       topLeft: Radius.circular(5),
          //                       topRight: Radius.circular(5)
          //                   )
          //               ),
          //               child: Padding(
          //                 padding: const EdgeInsets.all(16.0),
          //                 child: Text('Buy Now',style: GoogleFonts.montserrat(textStyle: TextStyle(
          //                     color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15
          //                 ))),
          //               ),
          //             ),
          //           ),
          //         ),
          //         Align(
          //           alignment: Alignment.topLeft,
          //           child: Padding(
          //             padding: const EdgeInsets.only(top:20,left: 20),
          //             child: Text('(Rs.900 per Membership for minimum 10 members)',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                 color: Colors.white,fontWeight: FontWeight.w400,fontSize: 19
          //             ))),
          //           ),
          //         ),
          //
          //
          //         Align(
          //           alignment: Alignment.topLeft,
          //           child: Padding(
          //             padding: const EdgeInsets.only(top:20,left: 20),
          //             child: Table(
          //               columnWidths: {
          //                 0:FlexColumnWidth(0.5),
          //                 1:FlexColumnWidth(5)
          //               },
          //               children: [
          //                 TableRow(
          //                     children: [
          //                       Padding(
          //                         padding: const EdgeInsets.only(right:5,top: 5),
          //                         child: Container(
          //                           decoration: BoxDecoration(
          //                               color: Color.fromRGBO(118,178,84,1),
          //                               borderRadius: BorderRadius.only(
          //                                 // bottomRight: Radius.circular(5),
          //                                 // bottomLeft: Radius.circular(5),
          //                                 // topLeft: Radius.circular(5),
          //                                 // topRight: Radius.circular(5)
          //                               )
          //                           ),
          //                           child: Icon(Icons.check,color: Colors.white,),
          //                         ),
          //                       ),
          //
          //                       Column(
          //                         children: [
          //                           Text('Annual Membership valid for minimum 10 individual members and more.',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                               color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //                           ))),
          //                         ],
          //                       ),
          //                     ]
          //                 )
          //
          //               ],
          //             ),
          //           ),
          //         ),
          //         Align(
          //           alignment: Alignment.topLeft,
          //           child: Padding(
          //             padding: const EdgeInsets.only(top:20,left: 20),
          //             child:
          //
          //
          //             Table(
          //               columnWidths: {
          //                 0:FlexColumnWidth(0.5),
          //                 1:FlexColumnWidth(5)
          //               },
          //               children: [
          //                 TableRow(
          //                     children: [
          //                       Padding(
          //                         padding: const EdgeInsets.only(right:5,top: 5),
          //                         child:  Container(
          //                           decoration: BoxDecoration(
          //                               color: Color.fromRGBO(118,178,84,1),
          //                               borderRadius: BorderRadius.only(
          //                                 // bottomRight: Radius.circular(5),
          //                                 // bottomLeft: Radius.circular(5),
          //                                 // topLeft: Radius.circular(5),
          //                                 // topRight: Radius.circular(5)
          //                               )
          //                           ),
          //                           child: Icon(Icons.check,color: Colors.white,),
          //                         ),
          //                       ),
          //
          //
          //
          //                       Text('Annual Seminars and other paid Live Events @30% off.',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                           color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //                       ))),
          //                     ]
          //                 )
          //
          //               ],
          //             ),
          //
          //           ),
          //         ),
          //         Align(
          //           alignment: Alignment.topLeft,
          //           child: Padding(
          //             padding: const EdgeInsets.only(top:20,left: 20),
          //             child:
          //             Table(
          //               columnWidths: {
          //                 0:FlexColumnWidth(0.5),
          //                 1:FlexColumnWidth(5)
          //               },
          //               children: [
          //                 TableRow(
          //                     children: [
          //                       Padding(
          //                         padding: const EdgeInsets.only(right:5,top: 5),
          //                         child:  Container(
          //                           decoration: BoxDecoration(
          //                               color: Color.fromRGBO(118,178,84,1),
          //                               borderRadius: BorderRadius.only(
          //                                 // bottomRight: Radius.circular(5),
          //                                 // bottomLeft: Radius.circular(5),
          //                                 // topLeft: Radius.circular(5),
          //                                 // topRight: Radius.circular(5)
          //                               )
          //                           ),
          //                           child: Icon(Icons.check,color: Colors.white,),
          //                         ),
          //                       ),
          //
          //
          //
          //                       Text('Access Platform Link for your colleagues on LMS @Rs 750 for 100+ members',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                           color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //                       ))),
          //                     ]
          //                 )
          //
          //               ],
          //             ),
          //
          //
          //           ),
          //         ),
          //         Align(
          //           alignment: Alignment.topLeft,
          //           child: Padding(
          //             padding: const EdgeInsets.only(top:20,left: 20),
          //             child:
          //
          //             Table(
          //               columnWidths: {
          //                 0:FlexColumnWidth(0.5),
          //                 1:FlexColumnWidth(5)
          //               },
          //               children: [
          //                 TableRow(
          //                     children: [
          //                       Padding(
          //                         padding: const EdgeInsets.only(right:5,top: 5),
          //                         child: Container(
          //                           decoration: BoxDecoration(
          //                               color: Color.fromRGBO(118,178,84,1),
          //                               borderRadius: BorderRadius.only(
          //                                 // bottomRight: Radius.circular(5),
          //                                 // bottomLeft: Radius.circular(5),
          //                                 // topLeft: Radius.circular(5),
          //                                 // topRight: Radius.circular(5)
          //                               )
          //                           ),
          //                           child: Icon(Icons.check,color: Colors.white,),
          //                         ),
          //                       ),
          //
          //
          //
          //
          //
          //                       Text('Launch one or more Live topical Masterclasses every Month (Launched directly from our platform)',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                           color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //                       ))),
          //                     ]
          //                 )
          //
          //               ],
          //             ),
          //
          //           ),
          //         ),
          //         Align(
          //           alignment: Alignment.topLeft,
          //           child: Padding(
          //             padding: const EdgeInsets.only(top:20,left: 20),
          //             child:
          //
          //             Table(
          //               columnWidths: {
          //                 0:FlexColumnWidth(0.5),
          //                 1:FlexColumnWidth(5)
          //               },
          //               children: [
          //                 TableRow(
          //                     children: [
          //                       Padding(
          //                         padding: const EdgeInsets.only(right:5,top: 5),
          //                         child:  Container(
          //                           decoration: BoxDecoration(
          //                               color: Color.fromRGBO(118,178,84,1),
          //                               borderRadius: BorderRadius.only(
          //                                 // bottomRight: Radius.circular(5),
          //                                 // bottomLeft: Radius.circular(5),
          //                                 // topLeft: Radius.circular(5),
          //                                 // topRight: Radius.circular(5)
          //                               )
          //                           ),
          //                           child: Icon(Icons.check,color: Colors.white,),
          //                         ),
          //                       ),
          //
          //
          //
          //
          //                       Text('Access World class LNOD Academy Programs at 25% off',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                           color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //                       ))),
          //                     ]
          //                 )
          //
          //               ],
          //             ),
          //
          //           ),
          //         ),
          //         Align(
          //           alignment: Alignment.topLeft,
          //           child: Padding(
          //             padding: const EdgeInsets.only(top:20,left: 20),
          //             child:
          //
          //             Table(
          //               columnWidths: {
          //                 0:FlexColumnWidth(0.5),
          //                 1:FlexColumnWidth(5)
          //               },
          //               children: [
          //                 TableRow(
          //                     children: [
          //                       Padding(
          //                         padding: const EdgeInsets.only(right:5,top: 5),
          //                         child:  Container(
          //                           decoration: BoxDecoration(
          //                               color: Color.fromRGBO(118,178,84,1),
          //                               borderRadius: BorderRadius.only(
          //                                 // bottomRight: Radius.circular(5),
          //                                 // bottomLeft: Radius.circular(5),
          //                                 // topLeft: Radius.circular(5),
          //                                 // topRight: Radius.circular(5)
          //                               )
          //                           ),
          //                           child: Icon(Icons.check,color: Colors.white,),
          //                         ),
          //                       ),
          //
          //
          //                       Text('Access Specially curated videos,podcasts and blogs to facilitate your learning.',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                           color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //                       ))),
          //                     ]
          //                 )
          //
          //               ],
          //             ),
          //
          //           ),
          //         ),
          //         Align(
          //           alignment: Alignment.topLeft,
          //           child: Padding(
          //             padding: const EdgeInsets.only(top:20,left: 20,bottom: 10),
          //             child:
          //             Table(
          //               columnWidths: {
          //                 0:FlexColumnWidth(0.5),
          //                 1:FlexColumnWidth(5)
          //               },
          //               children: [
          //                 TableRow(
          //                     children: [
          //                       Padding(
          //                         padding: const EdgeInsets.only(right:5,top: 5),
          //                         child:  Container(
          //                           decoration: BoxDecoration(
          //                               color: Color.fromRGBO(118,178,84,1),
          //                               borderRadius: BorderRadius.only(
          //                                 // bottomRight: Radius.circular(5),
          //                                 // bottomLeft: Radius.circular(5),
          //                                 // topLeft: Radius.circular(5),
          //                                 // topRight: Radius.circular(5)
          //                               )
          //                           ),
          //                           child: Icon(Icons.check,color: Colors.white,),
          //                         ),
          //                       ),
          //
          //
          //
          //
          //
          //                       Text('Avail Free courses and videos ',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                           color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //                       ))),
          //                     ]
          //                 )
          //
          //               ],
          //             ),
          //
          //           ),
          //         ),
          //         Align(
          //           alignment: Alignment.topLeft,
          //           child: Padding(
          //             padding: const EdgeInsets.only(top:20,left: 20,bottom: 10),
          //             child:
          //             Table(
          //               columnWidths: {
          //                 0:FlexColumnWidth(0.5),
          //                 1:FlexColumnWidth(5)
          //               },
          //               children: [
          //                 TableRow(
          //                     children: [
          //                       Padding(
          //                         padding: const EdgeInsets.only(right:5,top: 5),
          //                         child:  Container(
          //                           decoration: BoxDecoration(
          //                               color: Color.fromRGBO(118,178,84,1),
          //                               borderRadius: BorderRadius.only(
          //                                 // bottomRight: Radius.circular(5),
          //                                 // bottomLeft: Radius.circular(5),
          //                                 // topLeft: Radius.circular(5),
          //                                 // topRight: Radius.circular(5)
          //                               )
          //                           ),
          //                           child: Icon(Icons.check,color: Colors.white,),
          //                         ),
          //                       ),
          //
          //
          //
          //
          //
          //                       Text('Look for Special Offers for Lnod Roundtable members on The Learning Universe products and services ',style: GoogleFonts.poppins(textStyle: TextStyle(
          //                           color: Colors.white,fontWeight: FontWeight.w300,fontSize: 19
          //                       ))),
          //                     ]
          //                 )
          //
          //               ],
          //             ),
          //
          //           ),
          //         ),
          //       ],
          //
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
  // Future fetctOffers() async{
  //   final offering =await PurchaseApi.fetchOffers();
  //   print('dcf'+offering.toString());
  //   if(offering.isEmpty){
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No Plans Found')));
  //   }
  //   else {
  //     final packages=offering.map((offer) => offer.availablePackages)
  //     .expand((pair) => pair)
  //     .toList();
  //     showModalBottomSheet(
  //         context: context,
  //         builder: (context)=>Paywall(
  //           packages:packages,
  //           title:"Uprage your plan",
  //           description:"Uprage",
  //           onClickedPackeges:(package)async{
  //     await PurchaseApi.purchasePackage(package);
  //           }
  //         )
  //     );
  //     final offer = offering.first;
  //     print('Offer: $offer');
  //   }
  // }
}
