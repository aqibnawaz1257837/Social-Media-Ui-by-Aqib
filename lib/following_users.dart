import 'package:flutter/material.dart';

import 'data/data.dart';
import 'models/user_model.dart';


class FollowingUsers extends StatelessWidget {
  const FollowingUsers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:  EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          child: Text('Following ' ,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                letterSpacing: 3.0
            ),
          ),
        ),

        Container(
          height: 80.0,
          child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: (BuildContext context , int index){
                User user = users[index];
                return GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              offset: Offset(0,2),
                              blurRadius: 6.0
                          ),
                        ],
                        border: Border.all(
                          width: 2.0,
                          color: Theme.of(context).primaryColor,
                        )
                    ),
                    child: ClipOval(
                      child: Image(
                        height: 60.0,
                        width: 60.0,
                        fit: BoxFit.cover,
                        image: AssetImage(
                            user.profileImageUrl
                        ),
                      ),
                    ),
                  ),
                );
              }
          ),
        )
      ],

    );
  }
}
