import "package:flutter/material.dart";
import 'dart:math';


class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}



class _BookingState extends State<Booking> {
  List<ListItem> _dropdownItems = [
    ListItem(1, "First Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item")
  ];
  List<ListItem> _toItems = [
    ListItem(1, "First "),
    ListItem(2, "Second "),
    ListItem(3, "Third "),
    ListItem(4, "Fourth ")
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  List<DropdownMenuItem<ListItem>> _to;
  ListItem _selectedItem;
  List _choosenItem;

  void  initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _to = buildDropDownMenuItems(_toItems);
  }
  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List   listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;}




    @override
    Widget build(BuildContext context) {
      return MaterialApp(
          home: Scaffold(
              resizeToAvoidBottomInset: false,

              backgroundColor: Colors.white,
              body: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.green, Colors.yellow])),
                padding: EdgeInsets.only(top: 100, right: 25, left: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 250, width: 350,
                          //color: Colors.red,
                          child: Image.asset('assets/simple.png'),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        "Where's Your Ride",
                        style: TextStyle(fontSize: 34),
                      ),),
                    SizedBox(height: 5,),
                    Center(
                      child: Container(
                        height: 200,
                        // color: Colors.red,
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 35, left: 30,),
                              //padding for the from location part
                              child: Container(
                                alignment: Alignment.center,
                                height: 60,
                                // color: Colors.blue,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Transform.rotate(
                                        angle: 180 * pi / 180,
                                        child: Icon(
                                          Icons.airplanemode_active,
                                          size: 30,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 15.0,),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              child:

                                              DropdownButton<ListItem>(
                                                  hint: Text("From" ),
                                                  value: _selectedItem,
                                                  items: _dropdownMenuItems,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _selectedItem = value;
                                                    });
                                                  }
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 112, left: 30),
                              //padding for the to location part
                              child: Container(
                                height: 60,
                                // color: Colors.blue,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Transform.rotate(
                                        angle: 0,
                                        child: Icon(
                                          Icons.location_on,
                                          size: 30,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [

                                            Container(
                                              child: DropdownButton<ListItem>(
                                                  hint: Text("To"),
                                                  value: _selectedItem,
                                                  items: _dropdownMenuItems,
                                                  onChanged: ( values) {
                                                    setState(() {
                                                      _selectedItem = values;
                                                    });
                                                  }
                                              ),

                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 300, top: 70),
                              //padding for the black switch symbol
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                height: 50,
                                width: 50,
                                child: Icon(
                                  Icons.swap_horiz,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 280,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              'Check Availability',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
          ));
    }
  }
class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}