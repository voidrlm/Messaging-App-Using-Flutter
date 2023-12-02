import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> userList = [
    {
      'name': 'Tony',
      'lastMessage': 'Hello!',
      'avatar':
          'https://i.pinimg.com/originals/99/71/23/997123ba1bfc03b01c62848519c6c289.jpg',
      'status': 'active',
    },
    {
      'name': 'Wayne',
      'lastMessage': 'Hi there!',
      'avatar':
          'https://www.slashfilm.com/img/gallery/christian-bale-claims-his-pay-for-american-psycho-was-less-than-the-films-make-up-artists/l-intro-1672278324.jpg',
      'status': 'offline',
    },
    {
      'name': 'Bruce',
      'lastMessage': 'How are you?',
      'avatar': 'https://i.insider.com/5de6ddd479d7571d25446737?width=700',
      'status': 'active',
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
            title: Row(
              children: [
                Text(userList[index]['name']),
                SizedBox(width: 8),
                _buildStatusNotifier(userList[index]['status']),
              ],
            ),
            subtitle: Text(userList[index]['lastMessage']),
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
        color: status == 'active'
            ? Colors.green
            : const Color.fromARGB(255, 121, 121, 121),
      ),
    );
  }
}
