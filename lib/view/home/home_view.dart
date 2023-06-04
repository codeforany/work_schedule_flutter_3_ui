import 'package:flutter/material.dart';
import 'package:work_schedule/common/color_extenstion.dart';

import '../../common_widget/task_row.dart';
import '../../common_widget/top_progress_row.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectTab = 0;

  List topProgressArr = [
    {
      "name": "Working\nHours",
      "sub_name": "working hours exceeded by 3 hours",
      "max_val": 40,
      "val": 19,
      "displayType": "val",
    },
    {
      "name": "Your\nEfficiency",
      "sub_name": "Excellent result",
      "max_val": 100,
      "val": 82,
      "displayType": "per",
    },
    {
      "name": "Task\ncount",
      "sub_name": "Task count 50",
      "max_val": 100,
      "val": 40,
      "displayType": "per",
    },
  ];

  List taskArr = [
    {
      "dtime": "10:00AM",
      "name": "Meeting with front-end developers",
      "sub_name": "Flose Real Estate Project",
      "image": [
        {
          "id": "1",
          "image": "https://i.pravatar.cc/300?img=1",
          "name": "user1"
        },
        {
          "id": "2",
          "image": "https://i.pravatar.cc/300?img=2",
          "name": "user2"
        },
        {"id": "3", "image": "https://i.pravatar.cc/300?img=3", "name": "user3"}
      ],
      "time": "9:50 AM - 10:50AM"
    },
    {
      "dtime": "11:00AM",
      "name": "Internal Marking session",
      "sub_name": "Marking Department",
      "image": [
        {
          "id": "1",
          "image": "https://i.pravatar.cc/300?img=2",
          "name": "user1"
        },
        {
          "id": "2",
          "image": "https://i.pravatar.cc/300?img=3",
          "name": "user2"
        },
        {
          "id": "3",
          "image": "https://i.pravatar.cc/300?img=1",
          "name": "user3"
        },
      ],
      "time": "11:00 AM - 12:00PM"
    },
    {
      "dtime": "12:00PM",
      "name": "Meeting with front-end developers",
      "sub_name": "Flose Real Estate Project",
      "image": [
        {
          "id": "1",
          "image": "https://i.pravatar.cc/300?img=3",
          "name": "user1"
        },
        {
          "id": "2",
          "image": "https://i.pravatar.cc/300?img=1",
          "name": "user2"
        },
        {"id": "3", "image": "https://i.pravatar.cc/300?img=2", "name": "user3"}
      ],
      "time": "9:50 AM - 10:50AM"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Hello, Villie!",
                            style: TextStyle(
                                color: TColor.primary,
                                fontSize: 33,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        CircleAvatar(
                          child: Image.asset('assets/img/1.png'),
                          radius: 33,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "You progress",
                      style: TextStyle(
                          color: TColor.primary,
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: 240,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: topProgressArr.length,
                        itemBuilder: (context, index) {
                          var tObj = topProgressArr[index] as Map? ?? {};

                          return TopProgressRow(
                            tObj: tObj,
                            bgColor: index == 0 ? TColor.color1 : TColor.color2,
                            textColor: index == 0
                                ? TColor.color1Text
                                : TColor.color2Text,
                            isActivePadding: index == 0,
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Wednesday, March 7",
                            style: TextStyle(
                                color: TColor.primary,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Color(0xffE2E2E5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Icon(
                            Icons.today,
                            color: TColor.primary,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: taskArr.map((tObj) {
                          var index = taskArr.indexOf(tObj);

                          return TaskRow(
                            tObj: tObj,
                            index: index,
                          );
                        }).toList()),
                  ),
                ],
              ),
            ),
          ),

          //Bottom Bar
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                      color: TColor.primary,
                      borderRadius: BorderRadius.circular(35)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            selectTab = 0;
                          });

                          showModalBottomSheet(
                              
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Container(
                                  margin: const EdgeInsets.all(25),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: const BoxDecoration(
                                                    color: Color(0xffE2E2E5),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                child: Icon(
                                                  Icons.close,
                                                  color: TColor.primary,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Image.asset(
                                          'assets/img/ coffee.png',
                                          fit: BoxFit.fitWidth,
                                          width: 160,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Oh, you need\nsome rest!",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: TColor.primary,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Coffee machine can make\n a cappuccino especially for you in\n5 minutes. Do you want some coffee?",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: TColor.primary
                                                  .withOpacity(0.7),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(
                                          height: 50,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: TColor.primary),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                child: Center(
                                                    child: Text(
                                                  "No, later",
                                                  style: TextStyle(
                                                      color: TColor.primary,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),),
                                              ),
                                            ),),

                                            const SizedBox(width: 15,),

                                             Expanded(
                                                child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    color: TColor.color2,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                child: Center(
                                                    child: Text(
                                                  "Yes thanks!",
                                                  style: TextStyle(
                                                      color: TColor.color2Text,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                )),
                                              ),
                                            ))
                                          ],
                                        ),
                                      ]),
                                );
                              });
                        },
                        icon: Icon(
                          Icons.apps,
                          size: 25,
                          color: selectTab == 0 ? Colors.white : Colors.white54,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            selectTab = 1;
                          });
                        },
                        icon: Icon(
                          Icons.calendar_today,
                          size: 25,
                          color: selectTab == 1 ? Colors.white : Colors.white54,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            selectTab = 2;
                          });
                        },
                        icon: Icon(
                          Icons.today,
                          size: 25,
                          color: selectTab == 2 ? Colors.white : Colors.white54,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            selectTab = 3;
                          });
                        },
                        icon: Icon(
                          Icons.forum,
                          size: 25,
                          color: selectTab == 3 ? Colors.white : Colors.white54,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            selectTab = 4;
                          });
                        },
                        icon: Icon(
                          Icons.settings,
                          size: 25,
                          color: selectTab == 4 ? Colors.white : Colors.white54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
