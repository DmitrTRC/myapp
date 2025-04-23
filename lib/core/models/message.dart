class Message {
  final String id;
  final String senderId;
  final String groupId;
  final String content;
  final DateTime timestamp;
  final String priority; // e.g., "low", "medium", "high", "emergency"
  final List<Attachment> attachments;

  Message({
    required this.id,
    required this.senderId,
    required this.groupId,
    required this.content,
    required this.timestamp,
    required this.priority,
    this.attachments = const [],
  });
}

class Attachment {
  final String type; // e.g., "photo", "video", "audio"
  final String url;

  Attachment({
    required this.type,
    required this.url,
  });
}