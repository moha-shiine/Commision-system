import 'package:commision_system/%20%20%20%20DashboardPage.dart';
import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _selectedIndex = 0;
  bool isExpanded = true;

  final List<Widget> _pages = [
    DashboardPage(),
    Center(child: Text("Financial Data")),
    Center(child: Text("Transactions")),
    Center(child: Text("Reports")),
    Center(child: Text("Product Data")),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: isMobile ? AppBar() : null,
      drawer: isMobile ? _buildDrawer() : null, // Drawer for mobile
      body: Stack(
        children: [
          Row(
            children: [
              if (!isMobile) _buildSidebar(),
              Expanded(child: _pages[_selectedIndex]), // Main content area
            ],
          ),
          // Toggle button for expanding/collapsing sidebar
          if (!isMobile)
            Positioned(
              top: 10,
              left: isExpanded ? 230 : 84, // Adjusts based on sidebar width
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Shadow color
                        offset: Offset(4, 0), // Shadow position
                        blurRadius: 8, // Blur effect
                        spreadRadius: 2, // Spread effect
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Icon(
                      isExpanded ? Icons.arrow_back : Icons.arrow_forward,
                      size: 17,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Build sidebar for desktop layout
  Widget _buildSidebar() {
    return Container(
      width: isExpanded ? 250 : 100,
      color: Colors.black87,
      child: Column(
        children: [
          // Header with logo and name
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 20,
                  child: Icon(Icons.account_circle, color: Colors.white),
                ),
                if (isExpanded) SizedBox(width: 20),
                if (isExpanded)
                  Expanded(
                    child: Text(
                      "Nakapin",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
              ],
            ),
          ),
          Divider(color: Colors.grey.shade700),

          // NavigationRail for main items
          Expanded(
            child: NavigationRail(
              selectedLabelTextStyle: TextStyle(color: Colors.white),
              unselectedLabelTextStyle: TextStyle(color: Colors.black),
              elevation: 2,
              backgroundColor: Colors.pink.shade500,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              extended: isExpanded,
              destinations: [
                _buildNavigationRailDestination(
                  icon: Icons.home,
                  label: 'Home',
                  index: 0,
                ),
                _buildNavigationRailDestination(
                  icon: Icons.attach_money,
                  label: 'Financial Data',
                  index: 1,
                ),
                _buildNavigationRailDestination(
                  icon: Icons.swap_horiz,
                  label: 'Transactions',
                  index: 2,
                ),
                _buildNavigationRailDestination(
                  icon: Icons.report,
                  label: 'Reports',
                  index: 3,
                ),
                _buildNavigationRailDestination(
                  icon: Icons.category,
                  label: 'Product Data',
                  index: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Build a custom NavigationRailDestination
  NavigationRailDestination _buildNavigationRailDestination({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = _selectedIndex == index;

    return NavigationRailDestination(
      icon: Icon(icon, color: isSelected ? Colors.blue : Colors.white),
      label: isExpanded
          ? Text(
              label,
              style: TextStyle(color: isSelected ? Colors.blue : Colors.white),
            )
          : SizedBox(),
    );
  }

  // Build the drawer for mobile devices
  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(16.0),
            child: const Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 20,
                  child: Icon(Icons.account_circle, color: Colors.white),
                ),
                SizedBox(width: 10),
                Text(
                  "Nakapin",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
          ),
          Divider(),

          // Navigation items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () => _selectPage(0),
                ),
                ListTile(
                  leading: Icon(Icons.attach_money),
                  title: Text('Financial Data'),
                  onTap: () => _selectPage(1),
                ),
                ListTile(
                  leading: Icon(Icons.swap_horiz),
                  title: Text('Transactions'),
                  onTap: () => _selectPage(2),
                ),
                ListTile(
                  leading: Icon(Icons.report),
                  title: Text('Reports'),
                  onTap: () => _selectPage(3),
                ),
                ListTile(
                  leading: Icon(Icons.category),
                  title: Text('Product Data'),
                  onTap: () => _selectPage(4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Method to handle page selection
  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Close the drawer after selection
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}
