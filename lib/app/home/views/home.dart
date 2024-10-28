import 'package:flutter/material.dart';

void main() => runApp(AdminDashboardApp());

class AdminDashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AdminDashboard(),
    );
  }
}

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _selectedIndex = 0;
  bool isExpanded = true;

  final List<Widget> _pages = [
    Center(child: Text("Dashboard")),
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
      drawer: isMobile ? _buildDrawer() : null,
      body: Stack(
        children: [
          Row(
            children: [
              if (!isMobile) _buildSidebar(),
              Expanded(child: _pages[_selectedIndex]),
            ],
          ),
          if (!isMobile)
            Positioned(
              top: 10,
              left: isExpanded ? 230 : 84,
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
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(4, 0),
                        blurRadius: 8,
                        spreadRadius: 2,
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

  Widget _buildSidebar() {
    return Container(
      width: isExpanded ? 250 : 100,
      color: Colors.black87,
      child: Column(
        children: [
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
          Expanded(
            child: ListView(
              children: [
                _buildNavigationRailDestination(
                  icon: Icons.dashboard,
                  label: 'Dashboard',
                  index: 0,
                ),
                _buildNavigationRailDestination(
                  icon: Icons.attach_money,
                  label: 'Financial Data',
                  index: 1,
                ),
                NavigationRailDropdown(
                  isExpanded: isExpanded, // Pass the expanded state
                  onItemSelected: (int pageIndex) {
                    setState(() {
                      _selectedIndex = pageIndex;
                    });
                  },
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

  Widget _buildNavigationRailDestination({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = _selectedIndex == index;

    return ListTile(
      leading: Icon(icon, color: isSelected ? Colors.blue : Colors.white),
      title: isExpanded
          ? Text(
              label,
              style: TextStyle(color: isSelected ? Colors.blue : Colors.white),
            )
          : null,
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
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

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}

class NavigationRailDropdown extends StatefulWidget {
  final Function(int) onItemSelected;
  final bool isExpanded; // Accept the expanded state

  NavigationRailDropdown(
      {required this.onItemSelected, required this.isExpanded});

  @override
  _NavigationRailDropdownState createState() => _NavigationRailDropdownState();
}

class _NavigationRailDropdownState extends State<NavigationRailDropdown> {
  bool _isDropdownExpanded = false; // Local state for dropdown expansion

  void _toggleDropdown() {
    setState(() {
      _isDropdownExpanded = !_isDropdownExpanded; // Toggle dropdown expansion
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: widget.isExpanded
              ? Text(
                  'User Management',
                  style: TextStyle(color: Colors.white),
                )
              : SizedBox(),
          leading: Icon(Icons.people, color: Colors.white),
          trailing: Icon(
            _isDropdownExpanded ? Icons.expand_less : Icons.expand_more,
            color: Colors.white,
          ),
          onTap: _toggleDropdown,
        ),
        // Show dropdown items only if the sidebar is expanded
        if (_isDropdownExpanded) ...[
          _buildDropdownMenuItem('View Users', Icons.person, 2),
          _buildDropdownMenuItem('Add User', Icons.person_add, 3),
          _buildDropdownMenuItem('User Roles', Icons.admin_panel_settings, 4),
        ],
      ],
    );
  }

  Widget _buildDropdownMenuItem(String title, IconData icon, int pageIndex) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: widget.isExpanded
          ? Text(
              title,
              style: TextStyle(color: Colors.white),
            )
          : SizedBox(),
      onTap: () {
        widget.onItemSelected(pageIndex); // Trigger the page selection
        setState(() {
          _isDropdownExpanded = false; // Collapse dropdown after selection
        });
      },
    );
  }
}
