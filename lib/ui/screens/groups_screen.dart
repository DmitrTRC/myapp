import 'package:flutter/material.dart';
import '../../core/models/group.dart';
import '../../core/models/user.dart';

class GroupsScreen extends StatefulWidget {
  @override
  _GroupsScreenState createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  // Placeholder for fetching groups from a service/database
  List<Group> _groups = [
    Group(id: '1', name: 'Group Alpha', administrativeLocation: 'Location A', supervisoryAuthority: 'Authority X', members: ['user1', 'user2']),
    Group(id: '2', name: 'Group Bravo', administrativeLocation: 'Location B', supervisoryAuthority: 'Authority Y', members: ['user3', 'user4', 'user5']),
  ];

  // Placeholder for fetching users from a service/database
  List<User> _users = [
    User(id: 'user1', name: 'User One', role: 'Member', groupId: '1', contacts: 'contact1'),
    User(id: 'user2', name: 'User Two', role: 'Commander', groupId: '1', contacts: 'contact2'),
    User(id: 'user3', name: 'User Three', role: 'Member', groupId: '2', contacts: 'contact3'),
    User(id: 'user4', name: 'User Four', role: 'Member', groupId: '2', contacts: 'contact4'),
    User(id: 'user5', name: 'User Five', role: 'Commander', groupId: '2', contacts: 'contact5'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groups'),
      ),
      body: ListView.builder(
        itemCount: _groups.length,
        itemBuilder: (context, index) {
          final group = _groups[index];
          return ListTile(
            title: Text(group.name),
            subtitle: Text('Location: ${group.administrativeLocation}'),
            onTap: () {
              _openGroupDetails(group);
            },
          );
        },
      ),
    );
  }

  void _openGroupDetails(Group group) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GroupDetailsScreen(group: group, users: _users),
      ),
    );
  }
}

class GroupDetailsScreen extends StatelessWidget {
  final Group group;
  final List<User> users;

  GroupDetailsScreen({required this.group, required this.users});

  @override
  Widget build(BuildContext context) {
    List<User> groupMembers = users.where((user) => user.groupId == group.id).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Group: ${group.name}'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              _manageGroup(context, group);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: groupMembers.length,
        itemBuilder: (context, index) {
          final member = groupMembers[index];
          return ListTile(
            title: Text(member.name),
            subtitle: Text('Role: ${member.role}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _manageUsers(context, group);
        },
        child: Icon(Icons.person_add),
      ),
    );
  }

  void _manageGroup(BuildContext context, Group group) {
    // Navigate to a screen for managing group details
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ManageGroupScreen(group: group)));
  }

  void _manageUsers(BuildContext context, Group group) {
    // Navigate to a screen for managing users within the group
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ManageUsersScreen(group: group, users: users)));
  }
}

class ManageGroupScreen extends StatefulWidget {
  final Group group;

  ManageGroupScreen({required this.group});

  @override
  _ManageGroupScreenState createState() => _ManageGroupScreenState();
}

class _ManageGroupScreenState extends State<ManageGroupScreen> {
  late TextEditingController _nameController;
  late TextEditingController _locationController;
  late TextEditingController _authorityController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.group.name);
    _locationController = TextEditingController(text: widget.group.administrativeLocation);
    _authorityController = TextEditingController(text: widget.group.supervisoryAuthority);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _authorityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Group'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Group Name'),
            ),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Administrative Location'),
            ),
            TextField(
              controller: _authorityController,
              decoration: InputDecoration(labelText: 'Supervisory Authority'),
            ),
            ElevatedButton(
              onPressed: () {
                // Save the updated group information
                setState(() {
                  widget.group.name = _nameController.text;
                  widget.group.administrativeLocation = _locationController.text;
                  widget.group.supervisoryAuthority = _authorityController.text;
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class ManageUsersScreen extends StatelessWidget {
  final Group group;
  final List<User> users;

  ManageUsersScreen({required this.group, required this.users});

  @override
  Widget build(BuildContext context) {
    List<User> otherUsers = users.where((user) => user.groupId != group.id).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Users to Group'),
      ),
      body: ListView.builder(
        itemCount: otherUsers.length,
        itemBuilder: (context, index) {
          final user = otherUsers[index];
          return ListTile(
            title: Text(user.name),
            onTap: () {
              // Add the user to the group
              user.groupId = group.id;
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}