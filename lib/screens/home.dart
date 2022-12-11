import 'package:appointment/models/testData.dart';
import 'package:appointment/resources/color.manager.dart';
import 'package:appointment/resources/font.manager.dart';
import 'package:appointment/widgets/appointment_card.dart';
import 'package:flutter/material.dart';

import '../resources/string.manager.dart';
import '../resources/values.manager.dart';

import '../widgets/time_ratio.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const String routeName = '/home';

  static final textLines = Appointments();
  static final List buttons = [
    "All",
    "Today",
    "Tomorrow",
    "Past",
  ];

  static final String selected = buttons[2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.appBarLightPink,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(AppString.welcome, style: Theme.of(context).textTheme.headline3),
          Text(AppString.hello,
              style:
                  TextStyle(fontSize: FontSize.s16, color: ColorManager.appBarDarkPink)),
        ]),

        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/profile");
            },
            child: const Padding(
              padding: EdgeInsets.only(right: AppPadding.p18),
              child: CircleAvatar(
                radius: AppSize.s28,
                backgroundImage: NetworkImage('https://picsum.photos/200/300'),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: AppSize.s60,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: buttons.length,
                    itemBuilder: ((context, index) {
                      return Row(
                        children: [
                          TimeRatio(text: buttons[index], isSelect: false)
                        ],
                      );
                    })),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: textLines.appointments.length,
                      itemBuilder: (context, index) {
                        return AppointmentCard(
                            title: textLines.appointments[index]["title"],
                            due: textLines.appointments[index]["due"],
                            description: textLines.appointments[index]["description"]);
                      })),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/new_appointment");
        },
        backgroundColor: ColorManager.darkGreen,
        child: const Icon(Icons.add),
      ),
    );
  }
}
