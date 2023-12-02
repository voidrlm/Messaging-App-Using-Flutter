import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // Dummy data for user list
  final List<Map<String, String>> userList = [
    {
      'name': 'Tony',
      'lastMessage': 'Hello!',
      'avatar':
          'https://i.pinimg.com/originals/99/71/23/997123ba1bfc03b01c62848519c6c289.jpg'
    },
    {
      'name': 'Wayne',
      'lastMessage': 'Hi there!',
      'avatar':
          'https://www.slashfilm.com/img/gallery/christian-bale-claims-his-pay-for-american-psycho-was-less-than-the-films-make-up-artists/l-intro-1672278324.jpg'
    },
    {
      'name': 'Bruce',
      'lastMessage': 'How are you?',
      'avatar': 'https://i.insider.com/5de6ddd479d7571d25446737?width=700'
    },
    // Add more users as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends'),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(userList[index]['avatar']!),
            ),
            title: Text(userList[index]['name']!),
            subtitle: Text(userList[index]['lastMessage']!),
            onTap: () {
              print('${userList[index]['name']}');
            },
          );
        },
      ),
    );
  }
}
