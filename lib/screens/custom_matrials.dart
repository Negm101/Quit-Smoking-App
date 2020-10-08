import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:circular_check_box/circular_check_box.dart';

class CustomTiles extends StatefulWidget {
  final String title;
  final Color priorityColor;
  final DocumentSnapshot documentSnapshot;
  bool isChecked;
  CustomTiles({
    Key key,
    @required this.title,
    @required this.documentSnapshot,
    this.priorityColor = Colors.grey,
    this.isChecked = false,
  });

  @override
  _CustomTilesState createState() => _CustomTilesState();
}

class _CustomTilesState extends State<CustomTiles> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 10,
      width: MediaQuery.of(context).size.width,
      child: Container(
          color: Colors.grey[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 25,
                    color: getPriorityColor(),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Text(widget.documentSnapshot['title'],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: CircularCheckBox(
                  value: widget.documentSnapshot['status'],
                  onChanged: (bool value) {
                    setState(() {
                      widget.isChecked = value;
                    });
                  },
                ),
              )
            ],
          )),
    );
  }

  Color getPriorityColor() {
    if (widget.documentSnapshot['priority'] == '0')
      return Colors.grey;
    else if (widget.documentSnapshot['priority'] == '1')
      return Colors.yellow;
    else if (widget.documentSnapshot['priority'].toString() == '2')
      return Colors.red;

    return Colors.grey;
  }
}
