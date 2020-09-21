import 'package:flutter/material.dart';
import 'package:quit_smoking_app/custom_icons.dart';

class ProgressContainerScreen extends StatelessWidget {
  ProgressContainerScreen();

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.topCenter,
      child:  Stack(
        children: [
          /* TODO: Top bar alignment*/
          Container(
            color: Colors.blueAccent,
            padding: EdgeInsets.all(0),
            height: MediaQuery.of(context).size.height/3.25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // share and edit profile button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(CustomIcons.profile, color: Colors.white),
                      padding: EdgeInsets.only(bottom: 0),
                      onPressed: () {},
                    ),
                    IconButton(
                        icon: Icon(CustomIcons.share, color: Colors.white,),
                        padding: EdgeInsets.only(bottom: 0),
                        onPressed: () {},
                    )
                  ],
                ),
                // days counter display
                Container(
                  alignment: Alignment.topCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('20 Days', style: TextStyle(fontSize: 45, color: Colors.white),),
                      Text('Since Your Last Cigarette', style: TextStyle(fontSize: 16, color: Colors.white54),),
                  ],),
                ),
                // I smoked button
                Container(
                  height: 43,
                  alignment: Alignment.bottomCenter,
                  color: Colors.redAccent,
                  child: FlatButton(
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.refresh,color: Colors.white,size: 22,),
                        Text(' I SMOKED', style: TextStyle(fontSize: 16, color: Colors.white),),
                      ],
                    ),
                  ),
                ),
                /*TODO: Progress report */

              ],
            ),
          ),
        ],
      ),
    );

  }
}
