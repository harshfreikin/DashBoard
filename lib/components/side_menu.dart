import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dashboard/constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              DrawerHeader(
                child: Image.asset(
                  "images/adstack.png",
                  height: 20,
                ),
              ),
              DrawerHeader(
                decoration: BoxDecoration(
                    // Background color for DrawerHeader
                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.yellow,
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: ClipOval(
                          child: Image.asset(
                            "images/avtar3.png",
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 1), // Space between avatar and text
                    Text(
                      "Harsh Tiwari", // Name or label text
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Text color
                      ),
                    ),
                    SizedBox(height: defaultPadding),
                    ElevatedButton(
                      onPressed: () {
                        // Define action for "Learn More" button
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54, // Button background
                        foregroundColor: Colors.deepPurple,
                        overlayColor: Colors.purple,// Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text("Admin",style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
              ),
              ListTile(
                onTap: () {},
                horizontalTitleGap: 5.0,
                leading: SvgPicture.asset(
                  "images/home.svg",
                  height: 16,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {},
                // placement of SVG
                horizontalTitleGap: 5.0,
                leading: SvgPicture.asset(
                  "images/employee.svg",
                  height: 16,
                ),
                title: Text(
                  "Employeee",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {},
                horizontalTitleGap: 5.0,
                leading: SvgPicture.asset(
                  "images/attendance.svg",
                  height: 16,
                ),
                title: Text(
                  "Attendance",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {},
                horizontalTitleGap: 5.0,
                leading: SvgPicture.asset(
                  "images/book.svg",
                  height: 16,
                ),
                title: Text(
                  "Summary",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {},
                horizontalTitleGap: 5.0,
                leading: SvgPicture.asset(
                  "images/information.svg",
                  height: 16,
                ),
                title: Text(
                  "Information",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  ListTile(
                    onTap: () {},
                    title: Text(
                      "Adstacks",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  );
                  ListTile(
                    onTap: () {},
                    title: Text(
                      "Finance",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  );
                },
                title: Text(
                  "WORKSPACES",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,

                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              ListTile(
                onTap: () {},
                horizontalTitleGap: 5.0,
                leading: SvgPicture.asset(
                  "images/setting.svg",
                  height: 16,
                ),
                title: Text(
                  "Setting",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {},
                horizontalTitleGap: 5.0,
                leading: SvgPicture.asset(
                  "images/logout.svg",
                  height: 16,
                ),
                title: Text(
                  "LogOut",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
