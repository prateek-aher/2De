import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 140,
          leading: IconButton(
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => ProfileDetails()));
            },
            icon: Hero(
              tag: 'profilepicture',
              child: ClipOval(
                child: Image.asset('assets/dummy_user.png'),
              ),
            ),
          ),
          title: Text('Welcome'),
          centerTitle: false,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36)),
                color: Theme.of(context).primaryColor),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(28.0),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Start your search here',
                  filled: true,
                  focusColor: Colors.white,
                  fillColor: Colors.grey[350],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(28))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(28))),
                ),
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 18, right: 18, top: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Today\'s task',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  5.h,
                  GestureDetector(
                    onTap: () {
                      print('Today\'s task\n');
                    },
                    child: Container(
                      padding: EdgeInsets.all(18),
                      height: 110,
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(color: Colors.transparent)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('12',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold)),
                              Text('Pick Up',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal))
                            ],
                          ),
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Icon(
                              Icons.shopping_basket,
                              size: 70,
                            ),
                          ),
                          Container(
                            color: Colors.grey[300],
                            width: 2,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('18',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold)),
                              Text('Drop',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal))
                            ],
                          ),
                          Image.network(
                            'https://pngimg.com/uploads/pickup_truck/pickup_truck_PNG16290.png',
                            height: 70,
                            fit: BoxFit.fitWidth,
                          ),
                        ],
                      ),
                    ),
                  ),
                  10.h,
                  Text(
                    'My team',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  5.h,
                  Container(
                    height: 230,
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Colors.transparent)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.motorcycle,
                              size: 70,
                            ),
                            3.h,
                            Text('Bike Team',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal)),
                            5.h,
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  height: 80,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.green[100],
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('04',
                                          style: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold)),
                                      FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text('Active',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal)),
                                      )
                                    ],
                                  ),
                                ),
                                5.w,
                                Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    height: 80,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: Colors.red[200],
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('01',
                                            style: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold)),
                                        FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text('Inactive',
                                              style: TextStyle(
                                                  // fontSize: 16,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          ],
                        ),
                        Container(
                          color: Colors.grey[300],
                          width: 2,
                          // height: 100,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              'https://pngimg.com/uploads/pickup_truck/pickup_truck_PNG16290.png',
                              height: 70,
                              fit: BoxFit.fitWidth,
                            ),
                            3.h,
                            Text('Car Team',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal)),
                            5.h,
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.green[100],
                                      borderRadius: BorderRadius.circular(12)),
                                  height: 80,
                                  width: 60,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('03',
                                          style: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold)),
                                      FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text('Active',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal)),
                                      )
                                    ],
                                  ),
                                ),
                                5.w,
                                Container(
                                    decoration: BoxDecoration(
                                        color: Colors.red[200],
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    height: 80,
                                    width: 60,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('00',
                                            style: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold)),
                                        FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text('Inactive',
                                              style: TextStyle(
                                                  // fontSize: 16,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  10.h,
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {}, child: Text('View History')))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
