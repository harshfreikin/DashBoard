import 'package:flutter/material.dart';
import 'package:dashboard/constants.dart';
import '../responsive.dart';

class TopCreator extends StatelessWidget {
  const TopCreator({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    
    return Row(
      children: [
        // All Projects Section
        Expanded(
          child: Container(
            height: isMobile ? 400 : 320,
            padding: EdgeInsets.all(isMobile ? defaultPadding / 2 : defaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              color: Colors.indigo.shade900,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "All Projects",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 14.0 : 16.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: isMobile ? defaultPadding / 2 : defaultPadding),
                _buildProjectCard(context, "Technology behind the Blockchain", "Project #1", "images/cc.jpg"),
                SizedBox(height: isMobile ? defaultPadding / 2 : defaultPadding),
                _buildProjectCard(context, "Technology behind the Blockchain", "Project #1", "images/dd.jpg"),
                SizedBox(height: isMobile ? defaultPadding / 2 : defaultPadding),
                _buildProjectCard(context, "Technology behind the Blockchain", "Project #1", "images/bb.png"),
              ],
            ),
          ),
        ),
        SizedBox(width: isMobile ? defaultPadding / 2 : defaultPadding),

        // Top Creators Section
        Expanded(
          child: Container(
            height: isMobile ? 400 : 320,
            padding: EdgeInsets.all(isMobile ? defaultPadding / 2 : defaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              color: Colors.indigo.shade900,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Top Creators",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 14.0 : 16.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: isMobile ? defaultPadding / 2 : defaultPadding),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Name",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: isMobile ? 10.0 : 12.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Artworks",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: isMobile ? 10.0 : 12.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Rating",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: isMobile ? 10.0 : 12.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isMobile ? 8.0 : 16.0),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      _buildCreatorRow(context, "images/avtar1.png", "@harshfreikin", "9621", 4),
                      _buildCreatorRow(context, "images/avtar2.jpg", "@karl", "7032", 2),
                      _buildCreatorRow(context, "images/avtar4.png", "@maddison", "9621", 3),
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
  Widget _buildProjectCard(BuildContext context, String title, String projectNumber, String imagePath) {
    final bool isMobile = Responsive.isMobile(context);
    final double imageSize = isMobile ? 40 : 50;
    final double fontSize = isMobile ? 10.0 : 12.0;
    
    return Container(
      padding: EdgeInsets.all(isMobile ? 6.0 : 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
        color: Colors.deepPurpleAccent.shade700,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              imagePath,
              height: imageSize,
              width: imageSize,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: isMobile ? defaultPadding / 2 : defaultPadding),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  projectNumber,
                  style: TextStyle(
                    fontSize: fontSize - 2,
                    color: Colors.white70,
                  ),
                ),
                Text(
                  "See project details",
                  style: TextStyle(
                    fontSize: fontSize - 2,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit, 
              color: Colors.white, 
              size: isMobile ? 16 : 20
            ),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
        ],
      ),
    );
  }

  // Creator Card UI for 'Top Creators' section
  Widget _buildCreatorRow(BuildContext context, String imagePath, String name, String artworks, int rating) {
    final bool isMobile = Responsive.isMobile(context);
    final double avatarRadius = isMobile ? 14.0 : 18.0;
    final double fontSize = isMobile ? 12.0 : 14.0;
    final double barWidth = isMobile ? 6 : 8;
    final double barHeight = isMobile ? 12 : 14;
    final double barSpacing = isMobile ? 1 : 2;
    
    return Padding(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 4.0 : 8.0),
      child: Row(
        children: [
          // Avatar Image
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: avatarRadius,
          ),
          SizedBox(width: isMobile ? 4.0 : 8.0),

          // Name
          Expanded(
            flex: 2,
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // Artworks
          Expanded(
            flex: 1,
            child: Text(
              artworks,
              style: TextStyle(
                color: Colors.white70,
                fontSize: fontSize - 2,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Rating Bars
          Expanded(
            flex: 1,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final int maxBars = (constraints.maxWidth / (barWidth + barSpacing)).floor();
                final int displayRating = rating > maxBars ? maxBars : rating;
                
                return Container(
                  height: barHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < displayRating; i++)
                        Container(
                          width: barWidth,
                          height: barHeight,
                          margin: EdgeInsets.only(right: barSpacing),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(1),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
