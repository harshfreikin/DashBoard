import 'package:dashboard/constants.dart';
import 'package:flutter/material.dart';
import '../../components/Line_chart.dart';
import '../../components/header.dart';
import '../../components/middle.dart';
import '../../components/midle_first.dart';
import '../../components/third_side.dart';
import '../../components/side_menu.dart';
import '../../responsive.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isSideMenuOpen = false;

  void _toggleSideMenu() {
    setState(() {
      _isSideMenuOpen = !_isSideMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Responsive.isMobile(context) ? SideMenu() : null,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(Responsive.isMobile(context) ? defaultPadding / 2 : defaultPadding),
          child: Column(
            children: [
              // Header section with SearchField and Icons
              _buildHeader(context),
              SizedBox(height: Responsive.isMobile(context) ? defaultPadding : defaultPadding * 1.5),
              // Main content
              _buildMainContent(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    
    return Container(
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: isMobile
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.menu, color: Colors.grey[700]),
                          onPressed: _toggleSideMenu,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.notifications_outlined, color: Colors.grey[700]),
                          onPressed: () {},
                        ),
                        _buildProfileAvatar(context),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 12),
                SearchField(),
              ],
            )
          : Row(
              children: [
                if (!Responsive.isDesktop(context))
                  IconButton(
                    icon: Icon(Icons.menu, color: Colors.grey[700]),
                    onPressed: _toggleSideMenu,
                  ),
                Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                  ),
                ),
                Spacer(flex: 2),
                Expanded(
                  child: SearchField(),
                ),
                SizedBox(width: 16),
                IconButton(
                  icon: Icon(Icons.dashboard_outlined, color: Colors.grey[700]),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.notifications_outlined, color: Colors.grey[700]),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.logout, color: Colors.grey[700]),
                  onPressed: () {},
                ),
                SizedBox(width: 16),
                _buildProfileAvatar(context),
              ],
            ),
    );
  }

  Widget _buildProfileAvatar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: Responsive.isMobile(context) ? 20 : 25,
        backgroundColor: Colors.purple,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: ClipOval(
            child: Image.asset(
              "images/avtar3.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return Column(
        children: [
          _buildMainSection(),
          SizedBox(height: defaultPadding),
          _buildThirdSection(),
        ],
      );
    } else if (Responsive.isTablet(context)) {
      return Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: _buildMainSection(),
              ),
              SizedBox(width: defaultPadding),
              Expanded(
                flex: 1,
                child: _buildThirdSection(),
              ),
            ],
          ),
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: _buildMainSection(),
          ),
          SizedBox(width: defaultPadding),
          Expanded(
            flex: 2,
            child: _buildThirdSection(),
          ),
        ],
      );
    }
  }

  Widget _buildMainSection() {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTopRatingProjectContainer(),
          SizedBox(height: defaultPadding * 2),
          TopCreator(),
          SizedBox(height: defaultPadding * 2),
          CustomLineChart(),
        ],
      ),
    );
  }

  Widget _buildThirdSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: ThirdSide(),
    );
  }
}


