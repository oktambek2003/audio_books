import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:market/menu_Tab1.dart';
import 'package:market/my_tabs.dart';
import './app_colors.dart' as ApColors;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late List popularBooks;
   ScrollController? _scrollController;
   TabController? _tabController;
  ReadData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/popular_books.json')
        .then((value) {
      setState(() {
        popularBooks = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    ReadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ApColors.backraund,
      child: SafeArea(
          child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageIcon(
                    AssetImage("assets/menu-121.png"),
                    size: 24,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.notifications_active)
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, top: 30),
                  child: Text(
                    "Popular books",
                    style: TextStyle(fontSize: 30),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(right: 10, left: 10),
              height: 180,
              child: Stack(children: [
                Positioned(
                  top: 0,
                  left: -20,
                  right: 0,
                  child: Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                        controller: PageController(viewportFraction: 0.8),
                        itemCount:
                            popularBooks == null ? 0 : popularBooks.length,
                        itemBuilder: (_, i) {
                          return Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                image: AssetImage(popularBooks[i]["img"]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ]),
            ),
            Expanded(
                child: NestedScrollView(
                    controller: _scrollController,
                    headerSliverBuilder: (BuildContext   context,bool thisscorol) {
                      return [
                        SliverAppBar(
                          backgroundColor: Colors.white,
                          pinned: true,
                          bottom: PreferredSize(
                            
                            child: Container(
                            margin:  EdgeInsets.only(bottom: 30,left: 10,right: 10),
                            child: TabBar(
                              controller: _tabController,
                              indicatorPadding:const EdgeInsets.all(0),
                              indicatorSize: TabBarIndicatorSize.label,
                              labelPadding: EdgeInsets.only(left: 10),
                              isScrollable: true,
                              indicator: BoxDecoration( borderRadius: BorderRadius.circular(10),boxShadow: [BoxShadow(color: Colors.green.withOpacity(0.3),blurRadius: 7,offset: Offset(0,0))]),

                              tabs: [
                              AppTabs(color: ApColors.MenuColor1, text: "New"),
                              AppTabs(color:ApColors.MenuColor2, text: "Popular"),
                              AppTabs(color:ApColors.MenuColor3, text: "Trending")
                                 
                              ]),
                          ), preferredSize: Size.fromHeight(50)),
                        )
                      ];
                    },
                    body: TabBarView(
                      controller: _tabController,
                      children: [
                    AppTab1(),
                      Material(child: ListTile(leading: CircleAvatar(backgroundColor: Colors.red,),title:Text("COntent"),),),
                      Material(child: ListTile(leading: CircleAvatar(backgroundColor: Colors.grey,),title:Text("COntent"),),),


                    ])))
          ],
        ),
      )),
    );
  }
}
