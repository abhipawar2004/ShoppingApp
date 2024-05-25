import 'package:flutter/material.dart';

class UserProductItems extends StatelessWidget {
  final String title;
  final String imageUrl;
  UserProductItems(this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit),
          ),
           IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete,color:Colors.red),
          ),
        ]),
      ),
    );
  }
}
