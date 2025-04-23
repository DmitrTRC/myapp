import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/models/incident.dart';
import '../core/services/sqlite_service.dart';

class IncidentsScreen extends StatefulWidget {
  @override
  _IncidentsScreenState createState() => _IncidentsScreenState();
}

class _IncidentsScreenState extends State<IncidentsScreen> {
  final SqliteService _sqliteService = SqliteService();
  List<Incident> _incidents = [];

  @override
  void initState() {
    super.initState();
    _loadIncidents();
  }

  Future<void> _loadIncidents() async {
    final incidents = await _sqliteService.getAllIncidents();
    setState(() {
      _incidents = incidents;
    });
  }

  void _addNewIncident() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddIncidentScreen(),
      ),
    ).then((value) => _loadIncidents());
  }

  void _viewIncidentDetails(Incident incident) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IncidentDetailsScreen(incident: incident),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Incidents'),
      ),
      body: _incidents.isEmpty
          ? Center(child: Text('No incidents yet.'))
          : ListView.builder(
              itemCount: _incidents.length,
              itemBuilder: (context, index) {
                final incident = _incidents[index];
                return ListTile(
                  title: Text(
                    DateFormat('yyyy-MM-dd HH:mm').format(incident.timestamp),
                  ),
                  subtitle: Text(incident.text),
                  onTap: () => _viewIncidentDetails(incident),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewIncident,
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddIncidentScreen extends StatefulWidget {
  @override
  _AddIncidentScreenState createState() => _AddIncidentScreenState();
}

class _AddIncidentScreenState extends State<AddIncidentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  final SqliteService _sqliteService = SqliteService();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _saveIncident() async {
    if (_formKey.currentState!.validate()) {
      final newIncident = Incident(
        id: 0,
        timestamp: DateTime.now(),
        text: _textController.text,
        location: '',
        attachments: [],
      );
      await _sqliteService.insertIncident(newIncident);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Incident'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Incident Description',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveIncident,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IncidentDetailsScreen extends StatelessWidget {
  final Incident incident;

  IncidentDetailsScreen({required this.incident});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Incident Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat('yyyy-MM-dd HH:mm').format(incident.timestamp),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(incident.text),
          ],
        ),
      ),
    );
  }
}