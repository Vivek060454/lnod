

import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:socialv/network/rest_apis.dart';

class PurchaseApi{

  static const _apiKey='goog_fyCAQZxtVaOhnvaKMERPMVLVket';
  static const _apiKeyi='appl_mHCSgyOPyoNsTYrfhOTibcaWnYJ';
  static Future init()async{
    await Purchases.setDebugLogsEnabled(true);
    if(Platform.isAndroid){
    await Purchases.setup(_apiKey);}
    if(Platform.isIOS){
      await Purchases.setup(_apiKeyi);
    }
  }
  static Future<List<Offering>>  fetchOffers() async{
    final offerings = await Purchases.getOfferings();
    try {
      final offerings = await Purchases.getOfferings();
      final current = offerings.current;
      return current == null ? [] : [current];
    }
    on PlatformException catch (e){
      print('fjgh'+e.toString());
      print('fjgh'+offerings.toString());

      return[];
    }
  }
  static Future<bool> purchasePackage(Package package,title,context)async {
    try {
      await Purchases.purchasePackage(package).then((value) async {

        print("###########done###########");
        var id;
        if(title=='Students Membership (LNOD)'){
          await membershipupdate('student').then((value) {
            print('##########membership##########');
            print('######doneeee######'+value.toString());
            logout(context);
            toast('Please login again for activate membership', print: true);
          }).catchError((e) {
            print(e);
            print('######doneerrormembership######'+e.toString());
            print(e);
          });
        }
        else{
          await membershipupdate('individual').then((value) {
            print('######doneeee######'+value.toString());
            logout(context);
            toast('Please login again for activate membership', print: true);
          }).catchError((e) {
            print(e);
            print('######doneerrormembership######'+e.toString());
            print(e);
          });
        }
      }).catchError((e) {
        print(e);
        print("####checkmembershipdfrthdryjhg#######");
        print(e);
        // setState(() { });
        print(e);
      });

      // print("##########package id#############"+title.toString());
      // print('afgsrg'+a.toString());
      // print('#################################################');
      // print('afgsrg'+jsonDecode(a.toString()).toString());

      return true;
    }
    catch (e){
      return false;

    }
  }
}