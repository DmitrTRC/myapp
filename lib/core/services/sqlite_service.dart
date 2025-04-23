import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteService {
  static const String _dbName = 'patrol_assistant.db';
  static const int _dbVersion = 1;

  static const String _usersTable = 'users';
  static const String _groupsTable = 'groups';
  static const String _messagesTable = 'messages';
  static const String _incidentsTable = 'incidents';
  static const String _backgroundInfoTable = 'background_info';

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, _dbName);
    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await _createUsersTable(db);
    await _createGroupsTable(db);
    await _createMessagesTable(db);
    await _createIncidentsTable(db);
    await _createBackgroundInfoTable(db);
  }

  Future<void> _createUsersTable(Database db) async {
    await db.execute('''
      CREATE TABLE $_usersTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        role TEXT,
        group_id INTEGER,
        contacts TEXT
      )
    ''');
  }

  Future<void> _createGroupsTable(Database db) async {
    await db.execute('''
      CREATE TABLE $_groupsTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        administrative_location TEXT,
        supervisory_authority TEXT
      )
    ''');
  }

  Future<void> _createMessagesTable(Database db) async {
    await db.execute('''
      CREATE TABLE $_messagesTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        sender_id INTEGER,
        group_id INTEGER,
        content TEXT,
        timestamp INTEGER,
        priority TEXT,
        attachments TEXT
      )
    ''');
  }

  Future<void> _createIncidentsTable(Database db) async {
    await db.execute('''
      CREATE TABLE $_incidentsTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        timestamp INTEGER,
        text_description TEXT,
        location_coordinates TEXT,
        attachments TEXT
      )
    ''');
  }

  Future<void> _createBackgroundInfoTable(Database db) async {
    await db.execute('''
      CREATE TABLE $_backgroundInfoTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        content TEXT
      )
    ''');
  }

  // CRUD operations for Users
  Future<int> createUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.insert(_usersTable, user);
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    return await db.query(_usersTable);
  }

  Future<int> updateUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.update(_usersTable, user,
        where: 'id = ?', whereArgs: [user['id']]);
  }

  Future<int> deleteUser(int id) async {
    final db = await database;
    return await db.delete(_usersTable, where: 'id = ?', whereArgs: [id]);
  }

  // CRUD operations for Groups
  Future<int> createGroup(Map<String, dynamic> group) async {
    final db = await database;
    return await db.insert(_groupsTable, group);
  }

  Future<List<Map<String, dynamic>>> getGroups() async {
    final db = await database;
    return await db.query(_groupsTable);
  }

  Future<int> updateGroup(Map<String, dynamic> group) async {
    final db = await database;
    return await db.update(_groupsTable, group,
        where: 'id = ?', whereArgs: [group['id']]);
  }

  Future<int> deleteGroup(int id) async {
    final db = await database;
    return await db.delete(_groupsTable, where: 'id = ?', whereArgs: [id]);
  }

  // CRUD operations for Messages
  Future<int> createMessage(Map<String, dynamic> message) async {
    final db = await database;
    return await db.insert(_messagesTable, message);
  }

  Future<List<Map<String, dynamic>>> getMessages() async {
    final db = await database;
    return await db.query(_messagesTable);
  }

  Future<int> updateMessage(Map<String, dynamic> message) async {
    final db = await database;
    return await db.update(_messagesTable, message,
        where: 'id = ?', whereArgs: [message['id']]);
  }

  Future<int> deleteMessage(int id) async {
    final db = await database;
    return await db.delete(_messagesTable, where: 'id = ?', whereArgs: [id]);
  }

  // CRUD operations for Incidents
  Future<int> createIncident(Map<String, dynamic> incident) async {
    final db = await database;
    return await db.insert(_incidentsTable, incident);
  }

  Future<List<Map<String, dynamic>>> getIncidents() async {
    final db = await database;
    return await db.query(_incidentsTable);
  }

  Future<int> updateIncident(Map<String, dynamic> incident) async {
    final db = await database;
    return await db.update(_incidentsTable, incident,
        where: 'id = ?', whereArgs: [incident['id']]);
  }

  Future<int> deleteIncident(int id) async {
    final db = await database;
    return await db.delete(_incidentsTable, where: 'id = ?', whereArgs: [id]);
  }

  // CRUD operations for BackgroundInfo
  Future<int> createBackgroundInfo(Map<String, dynamic> info) async {
    final db = await database;
    return await db.insert(_backgroundInfoTable, info);
  }

  Future<List<Map<String, dynamic>>> getBackgroundInfo() async {
    final db = await database;
    return await db.query(_backgroundInfoTable);
  }

  Future<int> updateBackgroundInfo(Map<String, dynamic> info) async {
    final db = await database;
    return await db.update(_backgroundInfoTable, info,
        where: 'id = ?', whereArgs: [info['id']]);
  }

  Future<int> deleteBackgroundInfo(int id) async {
    final db = await database;
    return await db.delete(_backgroundInfoTable, where: 'id = ?', whereArgs: [id]);
  }
}