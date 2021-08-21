import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import 'cart_screen.dart';

class PromotionPage extends StatefulWidget {
  @override
  _PromotionPageState createState() => _PromotionPageState();
}

class _PromotionPageState extends State<PromotionPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

//        theme: ThemeData.light().copyWith(
//          platform: _platform ?? Theme.of(context).platform,
//        ),
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: HexColor('#36803a'),
                  title: Text(''),
                  leading: GestureDetector(),
                  actions: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: IconButton(
                              icon: LineIcon(LineIcons.shoppingCart),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CartPage()),
                                );
                              }),
                        )),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                    ),
                  ],
                ),
                body: SafeArea(
                    child: Column(children: <Widget>[
                  Container(
                    color: Colors.greenAccent,
                    height: MediaQuery.of(context).size.height /
                        2.2, // Also Including Tab-bar height.
//                        child: Chewie(
//                          controller: _chewieController,
//                        ),
                  ),
                  PreferredSize(
                    preferredSize: Size.fromHeight(50.0),
                    child: TabBar(
                      labelColor: Colors.black,
                      tabs: [
                        Tab(
                          text: 'Promotion 1',
                        ),
                        Tab(
                          text: 'Promotion 2',
                        ),
                        Tab(
                          text: 'Promotion 3',
                        )
                      ], // list of tabs
                    ),
                  ),
                  //TabBarView(children: [ImageList(),])
                  Expanded(
                    child: TabBarView(
                      children: [
                        Container(
                          color: Colors.deepOrange,
                          child: Center(child: Text('1')),
                        ),
                        Container(
                          color: Colors.red,
                          child: Center(child: Text('2')),
                        ),
                        Container(
                          color: Colors.yellowAccent,
                          child: Center(child: Text('3')),
                        ) // class name
                      ],
                    ),
                  ),
                ])))));
  }
}
