import 'package:flutter/material.dart';
import 'package:socialmediaappbyaqib/profile_screen.dart';

import 'data/data.dart';
import 'home_screen.dart';
import 'login_screen.dart';


class CustomDrawer extends StatelessWidget {

  _builderDrawerOption(Icon icon , String title , Function onTap){
    return ListTile(
      leading: icon,
      title: Text(
        title, style: TextStyle(
        fontSize: 20.0
      ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image(
                height: 200.0,
                width: double.infinity,
                image:
              AssetImage(
                currentUser.backgroundImageUrl,
              ),
                fit: BoxFit.cover,
              ),

              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 3.0 , color: Theme.of(context).primaryColor),
                  ),
                  child: ClipOval(
                    child: Image(
                      image: AssetImage(
                        currentUser.profileImageUrl
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  currentUser.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    letterSpacing: 1.5
                  ),
                )
              ],
              ),
              ),
            ],
          ),

          _builderDrawerOption(Icon(Icons.dashboard), 'Home',

              () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen(),
              ),
              ),
          ),

          _builderDrawerOption(Icon(Icons.chat), 'Chat', (){}),
          _builderDrawerOption(Icon(Icons.location_on), 'Map', (){}),
          _builderDrawerOption(Icon(Icons.account_circle), 'Your profile',

                () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ProfileScreen(
              user: currentUser,

            ),
            ),
            ),

          ),
          _builderDrawerOption(Icon(Icons.settings), 'Settings',(){}
          ),

          _builderDrawerOption(Icon(Icons.directions_run), 'Logout',

                () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen(),
            ),
            ),
          ),
        ],
      ),
    );
  }
}
