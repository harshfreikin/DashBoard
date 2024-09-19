import 'package:dashboard/constants.dart';
import 'package:flutter/material.dart';
import '../../components/Line_chart.dart';
import '../../components/header.dart';
import '../../components/middle.dart';
import '../../components/midle_first.dart';
import '../../components/third_side.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            // Header section with SearchField and Icons
            Row(
              children: [
                Text(
                  "Home",
                  style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize: 35.0),
                ),
                Spacer(flex: 2),
                Expanded(
                  child: SearchField(),
                ),
                SizedBox(width: 16), // Space between search and icons
                IconButton(
                  icon: Icon(Icons.dashboard_outlined), // Summary Icon
                  onPressed: () {
                    // Summary action here
                  },
                ),
                IconButton(
                  icon: Icon(Icons.notifications_outlined), // Bell Icon
                  onPressed: () {
                    // Notification action here
                  },
                ),
                IconButton(
                  icon: Icon(Icons.logout), // Logout Icon
                  onPressed: () {
                    // Logout action here
                  },
                ),
                SizedBox(width: 16),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.purple,
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: ClipOval(
                      child: Image.asset(
                        "images/avtar3.png",
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: defaultPadding),

            // Main row for content
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Added the new Ethereum 2.0 "Top Rating Project" container
                        buildTopRatingProjectContainer(),

                        SizedBox(height: 40),
                        // Padding between containers

                        TopCreator(),
                        // Assuming this is a widget for top creators

                        SizedBox(height: defaultPadding),
                        SizedBox(height: 40),

                        // Line chart
                        CustomLineChart(),
                      ],
                    ),
                  ),
                ),

                // Right-hand side column
                SizedBox(width: defaultPadding),
                Expanded(
                  flex: 2,
                  child: ThirdSide(), // Assuming this is another widget
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


