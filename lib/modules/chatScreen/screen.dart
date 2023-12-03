import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String userName;

  ChatScreen({required this.userName});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Map<String, String>> messages = [
    {'sender': 'receiver', 'message': 'Hello!'},
    {'sender': 'user', 'message': 'Hi there!'},
  ];

  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userName),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(messages[index]);
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessage(Map<String, String> message) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Align(
        alignment: message['sender'] == 'user'
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: message['sender'] == 'user' ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            message['message']!,
            style: TextStyle(
              color: message['sender'] == 'user' ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              _sendMessage();
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    String messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      setState(() {
        messages.add({'sender': 'user', 'message': messageText});
        _messageController.clear();
      });
    }
  }
}
