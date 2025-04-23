class Incident {
  final String id;
  final DateTime timestamp;
  final String textDescription;
  final double? latitude;
  final double? longitude;
  final List<String> attachments;

  Incident({
    required this.id,
    required this.timestamp,
    required this.textDescription,
    this.latitude,
    this.longitude,
    this.attachments = const [],
  });
}