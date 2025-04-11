import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dashboard/constants.dart';
import '../responsive.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    
    return Drawer(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: 0.8 + (0.2 * _animation.value),
            child: Opacity(
              opacity: _animation.value,
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      _buildDrawerHeader(context),
                      _buildProfileSection(context),
                      SizedBox(height: isMobile ? 8 : 16),
                      _buildMenuItems(context),
                      SizedBox(height: isMobile ? 16 : 32),
                      _buildBottomMenuItems(context),
                      SizedBox(height: isMobile ? 8 : 16),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDrawerHeader(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    
    return DrawerHeader(
      child: Row(
        children: [
          Center(
            child: Image.asset(
              "images/adstack.png",
              height: isMobile ? 30 : 100,
              fit: BoxFit.contain,
            ),
          ),
          Spacer(),
          if (isMobile)
            IconButton(
              icon: Icon(Icons.close, color: Colors.grey[800]),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
        ],
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Responsive.isMobile(context) ? 12 : 16,
        horizontal: Responsive.isMobile(context) ? 8 : 16,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.yellow.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: Responsive.isMobile(context) ? 25 : 35,
              backgroundColor: Colors.yellow,
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
          ),
          SizedBox(height: Responsive.isMobile(context) ? 8 : 12),
          Text(
            "Harsh Tiwari",
            style: TextStyle(
              fontSize: Responsive.isMobile(context) ? 16 : 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: Responsive.isMobile(context) ? 4 : 8),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context) ? 12 : 16,
              vertical: Responsive.isMobile(context) ? 6 : 8,
            ),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "Admin",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: Responsive.isMobile(context) ? 12 : 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    return Column(
      children: [
        _buildMenuItem(
          context: context,
          icon: "images/home.svg",
          title: "Home",
          isActive: true,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        _buildMenuItem(
          context: context,
          icon: "images/employee.svg",
          title: "Employee",
          onTap: () {
            Navigator.of(context).pop();
            // Navigate to Employee screen
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Navigating to Employee screen')),
            );
          },
        ),
        _buildMenuItem(
          context: context,
          icon: "images/attendance.svg",
          title: "Attendance",
          onTap: () {
            Navigator.of(context).pop();
            // Navigate to Attendance screen
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Navigating to Attendance screen')),
            );
          },
        ),
        _buildMenuItem(
          context: context,
          icon: "images/book.svg",
          title: "Summary",
          onTap: () {
            Navigator.of(context).pop();
            // Navigate to Summary screen
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Navigating to Summary screen')),
            );
          },
        ),
        _buildMenuItem(
          context: context,
          icon: "images/information.svg",
          title: "Information",
          onTap: () {
            Navigator.of(context).pop();
            // Navigate to Information screen
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Navigating to Information screen')),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.isMobile(context) ? 12 : 16,
            vertical: Responsive.isMobile(context) ? 6 : 8,
          ),
          child: Text(
            "WORKSPACES",
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
              fontSize: Responsive.isMobile(context) ? 12 : 14,
              letterSpacing: 1.2,
            ),
          ),
        ),
        _buildMenuItem(
          context: context,
          title: "Adstacks",
          showIcon: false,
          onTap: () {
            Navigator.of(context).pop();
            // Navigate to Adstacks screen
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Navigating to Adstacks screen')),
            );
          },
        ),
        _buildMenuItem(
          context: context,
          title: "Finance",
          showIcon: false,
          onTap: () {
            Navigator.of(context).pop();
            // Navigate to Finance screen
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Navigating to Finance screen')),
            );
          },
        ),
      ],
    );
  }

  Widget _buildBottomMenuItems(BuildContext context) {
    return Column(
      children: [
        _buildMenuItem(
          context: context,
          icon: "images/setting.svg",
          title: "Setting",
          onTap: () {
            Navigator.of(context).pop();
            // Navigate to Setting screen
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Navigating to Setting screen')),
            );
          },
        ),
        _buildMenuItem(
          context: context,
          icon: "images/logout.svg",
          title: "LogOut",
          onTap: () {
            Navigator.of(context).pop();
            // Show logout confirmation dialog
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Logout'),
                content: Text('Are you sure you want to logout?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Logged out successfully')),
                      );
                    },
                    child: Text('Logout'),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required BuildContext context,
    String? icon,
    required String title,
    bool isActive = false,
    bool showIcon = true,
    required VoidCallback onTap,
  }) {
    final bool isMobile = Responsive.isMobile(context);
    
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: onTap,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              margin: EdgeInsets.symmetric(
                horizontal: isMobile ? 8 : 12,
                vertical: 4,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 12 : 16,
                vertical: isMobile ? 8 : 12,
              ),
              decoration: BoxDecoration(
                color: isActive ? Colors.deepPurple.withOpacity(0.1) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isActive ? Colors.deepPurple.withOpacity(0.3) : Colors.transparent,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  if (showIcon && icon != null) ...[
                    SvgPicture.asset(
                      icon,
                      height: isMobile ? 20 : 24,
                      colorFilter: ColorFilter.mode(
                        isActive ? Colors.deepPurple : Colors.grey[600]!,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: isMobile ? 12 : 16),
                  ],
                  Text(
                    title,
                    style: TextStyle(
                      color: isActive ? Colors.deepPurple : Colors.grey[800],
                      fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                      fontSize: isMobile ? 14 : 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
