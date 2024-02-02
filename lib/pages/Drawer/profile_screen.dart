// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_sensei/themes/theme_constants.dart';
import 'package:study_sensei/themes/theme_provider.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({super.key});

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 70,
            ),
            const SizedBox(height: 20),
            itemProfile('Name', 'Mayank Shree Saridae', CupertinoIcons.person, Icon(Icons.arrow_forward, color: Colors.grey.shade400),),
            const SizedBox(height: 20),
            itemProfile('Phone', '8106079837', CupertinoIcons.phone, Icon(Icons.arrow_forward, color: Colors.grey.shade400),),
            const SizedBox(height: 20),
            itemProfile('Email', 'mayank.saridae@gmail.com', CupertinoIcons.mail, Icon(Icons.arrow_forward, color: Colors.grey.shade400),),
            const SizedBox(height: 20,),
            Material(
              elevation: 5,
              child: Container(
                height: 70,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      leading: Icon(CupertinoIcons.moon),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text('Dark Mode'),
                      ),
                      trailing: Switch(
                value: Provider.of<ThemeProvider>(context).themeData == darkmode,
                onChanged: (value) {
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                },
              ),
                    ),
                  ),
            ),
            SizedBox(height: 20.0,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text('Edit Profile')
              ),
            )
          ],
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData, Widget trailing) {
    return Material(
      elevation: 5.0,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          selectedTileColor: Theme.of(context).colorScheme.background,
          title: Text(title),
          subtitle: Text(subtitle),
          leading: Icon(iconData),
          trailing: trailing,
        ),
      ),
    );
  }
  }