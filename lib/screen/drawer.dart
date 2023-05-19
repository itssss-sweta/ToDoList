import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'package:intl/intl.dart';
import '../screen/login.dart';
import 'package:flutter/services.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: tdBGColor,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          padding: const EdgeInsets.only(top: 35, left: 15),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 167, 23, 13),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'To-Do-List',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                DateFormat('d MMM, y').format(DateTime.now()),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          title: const Text(
            'Your Profile',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const Divider(
          color: tdGrey,
          thickness: 0.5,
        ),
        ListTile(
          title: const Text(
            'Logout',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text(
                    'Are you sure you want to logout?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  actions: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          child: const Text(
                            'Yes',
                            style: TextStyle(
                              color: tdBlue,
                              fontSize: 15,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()),
                            );
                          },
                        ),
                        TextButton(
                          child: const Text(
                            'No',
                            style: TextStyle(
                              color: tdBlue,
                              fontSize: 15,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ],
                );
              },
            );
          },
        ),
        const Divider(
          color: tdGrey,
          thickness: 0.5,
        ),
        ListTile(
          title: const Text(
            'Exit',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text(
                    'Are you sure you want to exit?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  actions: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          child: const Text(
                            'Yes',
                            style: TextStyle(
                              color: tdBlue,
                              fontSize: 15,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            SystemNavigator.pop();
                          },
                        ),
                        TextButton(
                          child: const Text(
                            'No',
                            style: TextStyle(
                              color: tdBlue,
                              fontSize: 15,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
        ),
        const Divider(
          color: tdGrey,
          thickness: 0.5,
        ),
      ],
    ),
  );
}
