import 'dart:convert';
import 'dart:io';
import 'package:ecomtest/services/auth.dart';
import 'package:ecomtest/screens/splash.dart';
import 'package:ecomtest/widgets/productView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _key = GlobalKey<ScaffoldState>();
  //String? email =FirebaseAuth.instance.currentUser!.email;
  TextEditingController _emailUser = TextEditingController();
  TextEditingController _userName = TextEditingController();
  TextEditingController _password = TextEditingController();
  XFile? im_picked;
  File? img_file;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('aya'),
      ),
      endDrawer: Drawer(
        elevation: 10,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text('aya Ghoury'),
                accountEmail: Text('Aya@ghgh.com')),
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: img_file==null
                      ? AssetImage('images/icons/buy.png')
                      : Image.file(img_file!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,).image,//,
                  radius: width * .1,
                ),
                Positioned(
                    bottom: 50,
                    child: IconButton(
                        onPressed: () async {
                        im_picked=await ImagePicker().pickImage(source: ImageSource.gallery);
                       setState(() {
                         img_file=File(im_picked!.path) ;
                       });
                        }, icon: Icon(Icons.add_a_photo))),
              ],
            ),
            ListTile(
              title: Text('Add Products'),
              leading: Icon(Icons.add_box_outlined),
            ),
            ListTile(
              title: Text('Add Gategory'),
              leading: Icon(Icons.add_box_outlined),
            ),
            ListTile(
              title: Text('logout'),
              leading: Icon(Icons.exit_to_app),
              onTap: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                preferences.setBool('loginstate', false);
              },
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Stack(
                children: [
                  Positioned(
                      top: 10,
                      right: 20,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            _key.currentState!.openEndDrawer();
                          },
                          child: Icon(Icons.menu),
                        ),
                      )),
                  Positioned(
                      top: 10,
                      right: 60,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.shopping_cart),
                        ),
                      )),
                  Positioned(
                      top: 10,
                      right: 100,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.person),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'What are\nyou Shopping for?',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 8, right: 8, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      title: TextField(
                        textInputAction: TextInputAction.search,

                        //(pattern)async{
                        //await productProvider.search(productName: pattern);
                        //changeScreen(context, ProductSearchScreen());
                        //},
                        decoration: InputDecoration(
                          hintText: "blazer, dress...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('products '),
                    ),
                  )
                ],
              ),
              productView(),
            ],
          ),
        ),
      ),
    );
  }

}
