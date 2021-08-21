import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import 'cart_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                      ),
                    ),
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
                          text: 'One',
                        ),
                        Tab(
                          text: 'Two',
                        ),
                        Tab(
                          text: 'Three',
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
                          child: Center(child: Text('Tab1')),
                        ),
                        Container(
                          color: Colors.red,
                          child: Center(child: Text('Tab2')),
                        ),
                        Container(
                          color: Colors.yellowAccent,
                          child: Center(child: Text('Tab3')),
                        ) // class name
                      ],
                    ),
                  ),
                ])))));
  }
}
