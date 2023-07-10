import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shopping_app/utils/user_preferences.dart';
import 'package:shopping_app/views/shared/app_style.dart';
import 'package:shopping_app/views/shared/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLight = true;
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return Scaffold(
      backgroundColor: isLight ? Color(0xFFE2E2E2) : Colors.grey[900],
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 40, 0, 0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.29,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/cat_bg4.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Profile",
                  style: appstyle(36, Colors.white, FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: ListView(
                padding: EdgeInsets.only(top: 135),
                physics: BouncingScrollPhysics(),
                children: [
                  ProfileWidget(
                    imagePath: user.imagePath,
                    onClicked: () async {},
                  ),
                  SizedBox(height: 50),
                  Column(
                    children: [
                      Text(
                        user.name,
                        style: appstyle(
                          30,
                          isLight ? Colors.black : Colors.white,
                          FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        user.email,
                        style: appstyle(
                          18,
                          isLight ? Colors.blueGrey : Colors.lightBlue,
                          FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 50),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildButton(context, '4.7', 'Ranking'),
                            Container(
                              height: 27,
                              child: VerticalDivider(
                                color: isLight ? Colors.black : Colors.white,
                              ),
                            ),
                            buildButton(context, '527', 'Followers'),
                            Container(
                              height: 27,
                              child: VerticalDivider(
                                color: isLight ? Colors.black : Colors.white,
                              ),
                            ),
                            buildButton(context, '1', 'Following'),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isLight = isLight == true ? false : true;
                          });
                        },
                        child: Icon(
                          isLight ? Ionicons.moon_outline : Ionicons.moon,
                          color: isLight ? Colors.black : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: EdgeInsets.all(8),
        onPressed: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              value,
              style: appstyle(
                  18, isLight ? Colors.black : Colors.white, FontWeight.bold),
            ),
            SizedBox(height: 2),
            Text(
              text,
              style: appstyle(
                  15, isLight ? Colors.black : Colors.white, FontWeight.bold),
            ),
          ],
        ),
      );
}
