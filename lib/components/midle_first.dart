import 'package:flutter/material.dart';

class buildTopRatingProjectContainer extends StatelessWidget {
  const buildTopRatingProjectContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 300,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF7F00FF),
              Color(0xFFE100FF)
            ], // Gradient background colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            // Project description section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ETHEREUM 2.0",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Top Rating \nProject",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Trending project and high rating\nProject Created by team.",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      // Define action for "Learn More" button
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black54, // Button background
                      foregroundColor: Colors.deepPurple, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text("Learn More",style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            // Placeholder for 3D-like shapes (icons or images)
            Row(
              children: [
                Icon(Icons.circle, color: Colors.white, size: 40),
                SizedBox(width: 10),
                Icon(Icons.cable, color: Colors.white, size: 40),
                SizedBox(width: 10),
                Icon(Icons.diamond, color: Colors.white, size: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
