import 'package:flutter/material.dart';
import 'package:patrol_assistant/core/models/message.dart';

class ChatScreen extends StatefulWidget {
  final String groupId;

  const ChatScreen({Key? key, required this.groupId}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Message> _messages = []; 

  @override
  void initState() {
    super.initState();
    
    _loadMessages();
  }

  Future<void> _loadMessages() async {
      // TODO: Load messages from local DB or API
      // Example
      setState(() {
          _messages.addAll([
            Message(id: '1', senderId: 'user1', groupId: widget.groupId, content: 'Hello!', timestamp: DateTime.now(), priority: 'normal', attachments: []),
            Message(id: '2', senderId: 'user2', groupId: widget.groupId, content: 'Hi there!', timestamp: DateTime.now(), priority: 'normal', attachments: []),
        ]);
      });
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
         // TODO: Sending a new message to local DB and API
         // Example
        _messages.add(Message(
            id: DateTime.now().toString(),
            senderId: 'currentUser', 
            groupId: widget.groupId,
            content: _messageController.text,
            timestamp: DateTime.now(),
            priority: 'normal',
            attachments: []));
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Group Chat ${widget.groupId}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Text(message.content),
                  subtitle: Text('${message.senderId} - ${message.timestamp.toString()}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Enter message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}