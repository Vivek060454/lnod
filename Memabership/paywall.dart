import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:purchases_flutter/models/package_wrapper.dart';

import '../screens/shop/screens/product_detail_screen.dart';
import '../screens/shop/screens/product_detail_screen.dart';

class Paywall extends StatefulWidget {
  final String title;
  final String description;
  final List<Package> packages;
  final ValueChanged<Package> onClickedPackeges;
  const Paywall({
    Key? key,
    required this.title,
    required this.description,
    required this.packages,
    required this.onClickedPackeges
  }) : super(key: key);

  @override
  State<Paywall> createState() => _PaywallState();
}

class _PaywallState extends State<Paywall> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(widget.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(
            height: 16,
          ),
          Text(widget.description,textAlign: TextAlign.center,style: TextStyle(fontSize: 18),),
          buildPackeges()
      ],
    ),

    );
  }

 Widget buildPackeges() =>ListView.builder(

     shrinkWrap: true,
     primary: false,
     itemCount: widget.packages.length,
     itemBuilder: (context,index){
       final package=widget.packages[index];
       final product =package.product;
       print('hyr'+product.toString());
       return Card(
         color: Colors.amber,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(12),
         ),
         child: ListTile(
             contentPadding: EdgeInsets.all(8),
             title: Text(product.title),
             subtitle: Text(product.description),
             trailing: Text(product.priceString),
             onTap:()=>

            widget.onClickedPackeges(package)
         ),
       );
     });
}

// Widget buildPackage(BuildContext context, Package package){
//
// }