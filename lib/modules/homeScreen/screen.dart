import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> userList = [
    {
      'name': 'Tony',
      'lastMessage': 'Hello!',
      'avatar':
          'https://i.pinimg.com/originals/99/71/23/997123ba1bfc03b01c62848519c6c289.jpg',
      'status': 'active',
      'lastTextedTime': DateTime.now()
          .subtract(Duration(minutes: 15)), // Example: 15 minutes ago
    },
    {
      'name': 'Wayne',
      'lastMessage': 'Hi there!',
      'avatar':
          'https://www.slashfilm.com/img/gallery/christian-bale-claims-his-pay-for-american-psycho-was-less-than-the-films-make-up-artists/l-intro-1672278324.jpg',
      'status': 'offline',
      'lastTextedTime':
          DateTime.now().subtract(Duration(hours: 1)), // Example: 1 hour ago
    },
    {
      'name': 'Bruce',
      'lastMessage': 'How are you?',
      'avatar': 'https://i.insider.com/5de6ddd479d7571d25446737?width=700',
      'status': 'active',
      'lastTextedTime':
          DateTime.now().subtract(Duration(days: 1)), // Example: 1 day ago
    },
    // Add more users as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(userList[index]['avatar']),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(userList[index]['name']),
                    SizedBox(width: 8),
                    _buildStatusNotifier(userList[index]['status']),
                  ],
                ),
                Text(
                  userList[index]['lastMessage'],
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            subtitle: Text(
              _formatLastTextedTime(userList[index]['lastTextedTime']),
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {
              // Handle tapping on a user, e.g., navigate to a chat screen
              // For simplicity, you can print a message for now
              print('Tapped on ${userList[index]['name']}');
            },
          );
        },
      ),
    );
  }

  Widget _buildStatusNotifier(String status) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: status == 'active' ? Colors.green : Colors.red,
      ),
    );
  }

  String _formatLastTextedTime(DateTime lastTextedTime) {
    final now = DateTime.now();
    final difference = now.difference(lastTextedTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
