import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../About/AbouldWLFA.dart';
import '../About/About Governing Council.dart';
import '../About/AboutLNOD.dart';
import '../About/Aboutus.dart';
import '../About/FAQ.dart';
import '../About/Membership.dart';
import '../Blog.dart';
import '../LNOD Events/Asyncronous_E-Learning.dart';
import '../LNOD Events/LNOD_Academy.dart';
import '../LNOD Events/LNOD_Gallery.dart';
import '../LNOD Events/Upcoming_Events.dart';
import '../LNOD_Communitites_of.dart';
import '../Mytheme.dart';
import '../Resources/ExpertAdvisoryServices.dart';
import '../Resources/The_Learning_Universe.dart';
import '../Resources/Top_Feature_Videos.dart';
import '../Resources/Whos_Reading_What.dart';
import '../home.dart';

class Draweer extends StatefulWidget {
  const Draweer({Key? key}) : super(key: key);

  @override
  State<Draweer> createState() => _DraweerState();
}

class _DraweerState extends State<Draweer> {
  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height,
      decoration:  BoxDecoration(
        color:  Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
        // gradient: LinearGradient(
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        //   colors: [
        //
        //     Mytheme().medium,
        //     Mytheme().light
        //   ],
        // ),
        // image: const DecorationImage(
        //   image: AssetImage(
        //       'assets/Menu Background.png'),
        //   fit: BoxFit.cover,
        // )
      ),
      child: ListView(
        //Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[

          // SizedBox(
          //   height: 190,
          //   child:UserAccountsDrawerHeader(
          //     accountEmail:Text('email'.toString()),
          //     accountName: Text('name'.toString()),
          //     currentAccountPicture: CircleAvatar(
          //         backgroundColor: Colors.white,
          //         child:Text('name'.toString()[0].toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,fontSize:25,color: Color.fromRGBO(220, 95, 0, 1)))
          //       // backgroundImage: AssetImage("assets/Tritan-bike.png",),
          //     ),
          //   ),
          //
          //
          //
          // ),
          SizedBox(
            height: 50,
          ),
          // Align(
          //   alignment: Alignment.topRight,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: SvgPicture.asset(
          //       width : MediaQuery. of(context). size. width -150,
          //       "assets/Logo.svg",
          //       // semanticsLabel: 'Acme Logo'
          //     ),
          //   ),
          // ),

          Table(
            children: [
              TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 13,top: 11),
                      child: Align(
                        alignment: Alignment.topRight,

                        child: InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: SvgPicture.asset('assets/times-svgrepo-com.svg',color:Mytheme().text,height: 40,),
                            )),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.topRight,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(top: 8,left: 8,right: 16,),
                    //     child: Column(
                    //       children: [
                    //         Text('SURPLUS APP',style: GoogleFonts.lato(
                    //           textStyle: TextStyle(
                    //               fontSize: 19,
                    //               fontWeight: FontWeight.w700,
                    //               color: Mytheme().gre
                    //             // color: Color.fromRGBO(158, 63, 97, 100),
                    //           ),
                    //         )),
                    //         Align(
                    //           alignment: Alignment.topRight,
                    //           child: Text('V 1.0.0',style: GoogleFonts.lato(
                    //             textStyle: TextStyle(
                    //                 fontSize: 19,
                    //                 fontWeight: FontWeight.w400,
                    //                 color: Mytheme().gre
                    //               // color: Color.fromRGBO(158, 63, 97, 100),
                    //             ),
                    //           )),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ]
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            // leading: const Icon(Icons.contacts_rounded,color: Color.fromRGBO(220, 95, 0, 1),),
            title:  Text("Home",style:GoogleFonts.lato(
                textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Mytheme().text)),),
            onTap: ()  async {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>Home()));
              //  Navigator.popAndPushNamed(context, 'login');
            },
          ),

          ExpansionTile(
            trailing: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset('assets/Polygon.svg',height: 8,color:Mytheme().text,),
            ),
            title:Text('About',style:GoogleFonts.poppins(
                textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Mytheme().text)),),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  // leading: const Icon(Icons.contacts_rounded,color: Color.fromRGBO(220, 95, 0, 1),),
                  title:  Text("About US",style:GoogleFonts.lato(
                      textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color:Mytheme().text)),),
                  onTap: ()  async {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>AboutUs()));
                    // //  Navigator.popAndPushNamed(context, 'login');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  // leading: const Icon(Icons.contacts_rounded,color: Color.fromRGBO(220, 95, 0, 1),),
                  title:  Text("About LNOD",style:GoogleFonts.lato(
                      textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color:Mytheme().text)),),
                  onTap: ()  async {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>AboutLNOD()));
                    //  Navigator.popAndPushNamed(context, 'login');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  // leading: const Icon(Icons.contacts_rounded,color: Color.fromRGBO(220, 95, 0, 1),),
                  title:  Text("About Governing Council",style:GoogleFonts.lato(
                      textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color:Mytheme().text)),),
                  onTap: ()  async {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>AboutGoverningCouncil()));
                    //  Navigator.popAndPushNamed(context, 'login');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  // leading: const Icon(Icons.contacts_rounded,color: Color.fromRGBO(220, 95, 0, 1),),
                  title:  Text("About WLFA",style:GoogleFonts.lato(
                      textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color:Mytheme().text)),),
                  onTap: ()  async {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>AboutWLFA()));
                    //  Navigator.popAndPushNamed(context, 'login');
                  },
                ),

              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  // leading: const Icon(Icons.contacts_rounded,color: Color.fromRGBO(220, 95, 0, 1),),
                  title:  Text("Membership",style:GoogleFonts.lato(
                      textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color:Mytheme().text)),),
                  onTap: ()  async {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>Membership()));
                    //  Navigator.popAndPushNamed(context, 'login');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  // leading: const Icon(Icons.contacts_rounded,color: Color.fromRGBO(220, 95, 0, 1),),
                  title:  Text("FAQs",style:GoogleFonts.lato(
                      textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color:Mytheme().text)),),
                  onTap: ()  async {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>FAQS()));
                    //  Navigator.popAndPushNamed(context, 'login');
                  },
                ),
              ),
            ],),
          ListTile(
            // leading: const Icon(Icons.contacts_rounded,color: Color.fromRGBO(220, 95, 0, 1),),
            title:  Text("LNOD Communities of Practice",style:GoogleFonts.lato(
                textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Mytheme().text)),),
            onTap: ()  async {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>LNODCommunitiesOF(
                  )));
              //  Navigator.popAndPushNamed(context, 'login');
            },
          ),

          ExpansionTile(
            trailing: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset('assets/Polygon.svg',height: 8,color:Mytheme().text,),
            ),
            title:Text('Resources',style:GoogleFonts.poppins(
                textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Mytheme().text)),),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  // leading: const Icon(Icons.contacts_rounded,color: Color.fromRGBO(220, 95, 0, 1),),
                  title:  Text("Experet Advisory Services",style:GoogleFonts.lato(
                      textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color:Mytheme().text)),),
                  onTap: ()  async {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>ExperAdvisoryServices()));
                    // //  Navigator.popAndPushNamed(context, 'login');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  // leading: const Icon(Icons.contacts_rounded,color: Color.fromRGBO(220, 95, 0, 1),),
                  title:  Text("The Learning Universe",style:GoogleFonts.lato(
                      textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color:Mytheme().text)),),
                  onTap: ()  async {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>TheLearningUniverse()));
                    //  Navigator.popAndPushNamed(context, 'login');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  // leading: const Icon(Icons.contacts_rounded,color: Color.fromRGBO(220, 95, 0, 1),),
                  title:  Text("Top features Videos",style:GoogleFonts.lato(
                      textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color:Mytheme().text)),),
                  onTap: ()  async {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>TopFeatureVideos()));
                    //  Navigator.popAndPushNamed(context, 'login');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  // leading: const Icon(Icons.contacts_rounded,color: Color.fromRGBO(220, 95, 0, 1),),
                  title:  Text("Who's Reading What?",style:GoogleFonts.lato(
                      textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color:Mytheme().text)),),
                  onTap: ()  async {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>WhosReadingWhat()));
                    //  Navigator.popAndPushNamed(context, 'login');
                  },
                ),

              ),

            ],),
          ExpansionTile(
            trailing: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset('assets/Polygon.svg',height: 8,color:Mytheme().text,),
            ),
            title:Text('LNOD Events',style:GoogleFonts.poppins(
                textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Mytheme().text)),),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  // leading: const Icon(Icons.contacts_rounded,color: Color.fromRGBO(220, 95, 0, 1),),
                  title:  Text("Upcoming Events",style:GoogleFonts.lato(
                      textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color:Mytheme().text)),),
                  onTap: ()  async {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>UpcomingEvents()));
                    // //  Navigator.popAndPushNamed(context, 'login');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  // leading: const Icon(Icons.contacts_rounded,color: Color.fromRGBO(220, 95, 0, 1),),
                  title:  Text("LNOD Gallery",style:GoogleFonts.lato(
                      textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color:Mytheme().text)),),
                  onTap: ()  async {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>LNODGallery()));
                    //  Navigator.popAndPushNamed(context, 'login');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  // leading: const Icon(Icons.contacts_rounded,color: Color.fromRGBO(220, 95, 0, 1),),
                  title:  Text("LNOD Academy",style:GoogleFonts.lato(
                      textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color:Mytheme().text)),),
                  onTap: ()  async {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>LNODAcademy()));
                    //  Navigator.popAndPushNamed(context, 'login');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  // leading: const Icon(Icons.contacts_rounded,color: Color.fromRGBO(220, 95, 0, 1),),
                  title:  Text("Asynchronous E-Learning",style:GoogleFonts.lato(
                      textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color:Mytheme().text)),),
                  onTap: ()  async {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>AsyncronousELearning()));
                    //  Navigator.popAndPushNamed(context, 'login');
                  },
                ),

              ),

            ],),
          ListTile(
            // leading: const Icon(Icons.contacts_rounded,color: Color.fromRGBO(220, 95, 0, 1),),
            title:  Text("Blog",style:GoogleFonts.lato(
                textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Mytheme().text)),),
            onTap: ()  async {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>Blog()));
              //  Navigator.popAndPushNamed(context, 'login');
            },
          ),
Padding(
  padding: const EdgeInsets.only(left: 20,right: 20),
  child:   Table(
    children: [
     TableRow(
       children: [
         Padding(
           padding: const EdgeInsets.only(top: 15,left: 20),
           child: Container(
             child: Row(
               children: [
                 Icon(Icons.crop_square),
                 Text('Login',style:GoogleFonts.poppins(
                     textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Color.fromRGBO(80, 80, 80,1))))
               ],
             ),
           ),
         ),
         Container(
           decoration: BoxDecoration(
             color: Color.fromRGBO(255, 198, 0,1),
             borderRadius: BorderRadius.circular(30)
           ),
           child: Padding(
             padding: const EdgeInsets.all(13.0),
             child: Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 10),
                   child: Icon(Icons.person_2_outlined),
                 ),
                 Text('Register',style:GoogleFonts.poppins(
                     textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Color.fromRGBO(7, 41, 77,1))))

               ],
             ),
           ),
         )
       ]
     )
    ],
  ),
)
        ],
      ),
    );
  }
}
