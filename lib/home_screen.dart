import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialmediaappbyaqib/data/data.dart';

import 'custom_drawer.dart';
import 'following_users.dart';
import 'post_carousel.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  TabController _tabController;
  PageController _pageController;


  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0 , viewportFraction:  0.8);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor
        ),
        title: Center(
          child: Text(
            'FRENZY ', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              color: Theme.of(context).primaryColor,
              letterSpacing: 10.0
          ),
          ),
        ),
        bottom: TabBar(
          indicatorWeight: 3.0,
          controller: _tabController,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 18.0
          ),
          tabs: <Widget>[
            Tab(text: 'Trending',),
            Tab(text: 'Latest',),
          ],
        ),
      ),

      drawer: CustomDrawer(),

      body: ListView(
        children: <Widget>[
          FollowingUsers(),
          PostCorausel(
            pageController: _pageController,
            title: 'Posts',
            posts: posts,
          )
        ],
      )


    );
  }
}

