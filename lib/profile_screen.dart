import 'package:flutter/material.dart';
import 'package:socialmediaappbyaqib/custom_drawer.dart';
import 'package:socialmediaappbyaqib/post_carousel.dart';
import 'package:socialmediaappbyaqib/profile_clipper.dart';

import 'models/user_model.dart';


class ProfileScreen extends StatefulWidget {

  final User user;

  ProfileScreen({this.user});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  
  final GlobalKey<ScaffoldState> _scafoldstate = GlobalKey<ScaffoldState>();
  
  PageController _yourPostPaeController ;
  PageController _FavoritesPaeController ;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _yourPostPaeController = PageController(initialPage: 0 , viewportFraction: 0.8);
    _FavoritesPaeController = PageController(initialPage: 0 , viewportFraction: 0.8);



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: _scafoldstate,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Stack(
              alignment: Alignment.center,
              children: <Widget>[


                ClipPath(
                  clipper: ProfileClipper(),
                    child: Image(
                      height: 300.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image:
                      AssetImage(
                          widget.user.backgroundImageUrl
                      ),
                    ),
                ),
                Positioned(
                  top: 50.0,
                  left: 20.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                    ),
                    iconSize: 30.0,
                    color: Theme.of(context).primaryColor,
                    onPressed: () => _scafoldstate.currentState.openDrawer(),
                  ),
                ),
                Positioned(
                    bottom: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 3.0, color: Theme.of(context).primaryColor),
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0,2),
                          blurRadius: 6.0,
                        ),],
                      ),
                      child: ClipOval(
                        child: Image(
                          height: 120.0,
                          width: 120.0,
                          image: AssetImage(
                            widget.user.profileImageUrl
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(widget.user.name , style: TextStyle(
                color: Colors.black54,
                fontSize: 27.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0
              ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                Column(
                  children: <Widget>[

                    Text("Following" ,

                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0
                      ),
                    ),
                    SizedBox(height: 2.0,),
                    Text(widget.user.following.toString() ,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0
                      ),
                    ),


                  ],
                ),

                Column(
                  children: <Widget>[

                    Text("Followers" ,

                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0
                      ),
                    ),
                    SizedBox(height: 2.0,),
                    Text(widget.user.followers.toString() ,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0
                      ),
                    ),
                  ],
                ),
              ],
            ),

            PostCorausel(
              pageController: _yourPostPaeController,
              title: 'Your Posts',
              posts: widget.user.posts,
            ),
            PostCorausel(
              pageController: _FavoritesPaeController,
              title: 'Your Favorites',
              posts: widget.user.favorites,
            ),

          ],
        ),
      ),
    );
  }
}

