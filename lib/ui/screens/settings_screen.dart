import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Placeholder for user data - replace with actual data fetching
  String _userName = "John Doe";
  String _userRole = "Member";
  String _userGroup = "Group Alpha";

  // Placeholder for settings - replace with actual settings
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text('User Information'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: $_userName'),
                Text('Role: $_userRole'),
                Text('Group: $_userGroup'),
              ],
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                  // TODO: Update settings in storage
                });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text('Dark Mode'),
            trailing: Switch(
              value: _darkModeEnabled,
              onChanged: (bool value) {
                setState(() {
                  _darkModeEnabled = value;
                  // TODO: Update settings and theme
                });
              },
            ),
          ),
          Divider(),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement data synchronization logic
              _showSnackBar('Data synchronization started...');
            },
            child: Text('Synchronize Data'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement report generation logic
              _showSnackBar('Generating report...');
            },
            child: Text('Generate and Download Report'),
          ),
          SizedBox(height: 16),
          // Placeholder for period selection - replace with actual implementation
          Text('Select period for report'),
          // TODO: add period select
        ],
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}