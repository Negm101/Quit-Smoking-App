import 'package:flutter/material.dart';
import 'package:circular_check_box/circular_check_box.dart';

class CustomTiles extends StatefulWidget {
  final String title;
  final Color priorityColor;
  bool isChecked;
  CustomTiles({
    Key key,
    @required this.title,
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
                    color: widget.priorityColor,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Text(widget.title,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: CircularCheckBox(
                  value: widget.isChecked,
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
}
