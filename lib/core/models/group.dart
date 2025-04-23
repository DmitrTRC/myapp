class Group {
  final String name;
  final String administrativeLocation;
  final String supervisoryAuthority;
  final List<String> memberIds;

  Group({
    required this.name,
    required this.administrativeLocation,
    required this.supervisoryAuthority,
    required this.memberIds,
  });
}