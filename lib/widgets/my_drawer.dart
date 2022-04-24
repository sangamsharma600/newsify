import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screens/about_us.dart';
import '../screens/terms_and_conditions.dart';



String _rateUsUrl = 'https://linkedin.com/in/sangamsharma600';
String _contactUsUrl = 'mailto:sangamsharma600@gmail.com';

void _launchRateUsURL() async {
  if (!await launch(_rateUsUrl)) throw 'Could not launch $_rateUsUrl';
}

void _launchContactUsURL()async{
  if(!await launch(_contactUsUrl,)) throw "Could not launch $_contactUsUrl";
}



class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      child: ListView(
        children: [
          const DrawerHeader(
            padding: EdgeInsets.all(0),
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.all(0),
              accountName: Text(
                'NewsIfy',
                style: TextStyle(fontSize: 18),
              ),  
              accountEmail: Text(
                'newsify@gmail.com',
                style: TextStyle(fontSize: 16),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/NewsIfy Logo.png")
              ),
            ),
          ),
          ListTile(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (builder)=>const AboutUs(),),);
          },
            leading: const Icon(
              Icons.info,
              color: Colors.white,
            ),
            title: const Text(
              "About Us",
              style: TextStyle(color: Colors.white, fontSize: 17),

            ),
          ),
          ListTile(
            onTap: (){
              _launchRateUsURL();
            },
            leading: const Icon(
              Icons.star,
              color: Colors.white,
            ),
            title: const Text(
              "Rate Us",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
          ListTile(
            onTap: (){
              _launchContactUsURL();
            },
            leading: const Icon(
              Icons.mail,
              color: Colors.white,
            ),
            title: const Text(
              "Contact Us",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (builder)=>const TermsAndConditions(),),);
            },
            leading: const Icon(
              Icons.info,
              color: Colors.white,
            ),
            title: const Text(
              "Terms and Conditions",
              style: TextStyle(color: Colors.white, fontSize: 19),
            ),
          ),
        ],
      ),
    );
  }
}
