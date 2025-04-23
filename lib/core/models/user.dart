class User {
  final String id;
  final String name;
  final String role;
  final String groupId;
  final List<String> contacts;

  User({
    required this.id,
    required this.name,
    required this.role,
    required this.groupId,
    required this.contacts,
  });
}