import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class banniere_du_haut extends StatelessWidget {
  const banniere_du_haut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Stack(
        children: [
          Material(
            elevation: 20,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color(0xFF6e8f92),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipOval(
                    child:
                    Image.network(
                      'https://avatars.githubusercontent.com/u/11493174',
                      fit:BoxFit.fill,
                    ),
                  ),
                ),
                const Spacer(),
                const Expanded(
                  flex: 8,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Profession",
                          style: TextStyle(fontSize:32.0,
                              color: Color(0xFF204f4f),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Roboto"),
                        ),

                        Text(
                          "Passionné des chats",
                          style: TextStyle(fontSize:24.0,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w200,
                              fontFamily: "Roboto"),
                        ),
                      ]
                  ),
                )
              ]

          ),
        ],
      ),
    );
  }
}