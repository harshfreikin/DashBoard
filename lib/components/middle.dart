import 'package:flutter/material.dart';
import 'package:dashboard/constants.dart';


class TopCreator extends StatelessWidget {
  const TopCreator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // All Projects Section
        Expanded(
          child: Container(
            height: 320,
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              color: Colors.indigo.shade900, // Matching background color for All Projects
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "All Projects",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: defaultPadding),
                _buildProjectCard("Technology behind the Blockchain", "Project #1", "images/cc.jpg"),
                SizedBox(height: defaultPadding),
                _buildProjectCard("Technology behind the Blockchain", "Project #1", "images/dd.jpg"),
                SizedBox(height: defaultPadding),
                _buildProjectCard("Technology behind the Blockchain", "Project #1", "images/bb.png"),
              ],
            ),
          ),
        ),
        SizedBox(width: defaultPadding),

        // Top Creators Section
        Expanded(
          child: Container(
            height: 320,
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              color: Colors.indigo.shade900, // Matching background color for Top Creators
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Top Creators",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: defaultPadding),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Name",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Artworks",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Rating",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      _buildCreatorRow("images/avtar1.png", "@harshfreikin", "9621", 4),
                      _buildCreatorRow("images/avtar2.jpg", "@karl", "7032", 2),
                      _buildCreatorRow("images/avtar4.png", "@maddison", "9621", 3),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Project Card UI for 'All Projects' section
  Widget _buildProjectCard(String title, String projectNumber, String imagePath) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
        color: Colors.deepPurpleAccent.shade700,
      ),
      child: Row(
        children: [
          Image.asset(imagePath, height: 50, width: 50, fit: BoxFit.fill),
          SizedBox(width: defaultPadding),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
              Text(
                projectNumber,
                style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.white70,
                ),
              ),
              Text(
                "See project details",
                style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              // Action for edit/pencil icon
            },
            icon: Icon(Icons.edit, color: Colors.white),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
        ],
      ),
    );
  }

  // Creator Card UI for 'Top Creators' section
  Widget _buildCreatorRow(String imagePath, String name, String artworks, int rating) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          // Avatar Image
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 18.0, // Adjust size if necessary
          ),
          SizedBox(width: defaultPadding),

          // Name and Artworks
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
          ),
          SizedBox(width: 25),
          Expanded(
            child: Text(
              artworks,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12.0,
              ),
            ),
          ),

          // Rating Bars
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                rating,
                    (index) => Icon(
                  Icons.bar_chart,
                  color: Colors.blueAccent,
                  size: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
