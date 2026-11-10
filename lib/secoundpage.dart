import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            subtitle: Text("This is my home"),
            trailing: Expanded(
              child: Row(
                children: [
                  Text("5.0"),
                  SizedBox(width: 10),
                  Icon(Icons.star_rate),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            subtitle: Text("This is my home"),
            trailing: Expanded(
              child: Row(
                children: [
                  Text("5.0"),
                  SizedBox(width: 10),
                  Icon(Icons.star_rate),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            subtitle: Text("This is my home"),
            trailing: Expanded(
              child: Row(
                children: [
                  Text("5.0"),
                  SizedBox(width: 10),
                  Icon(Icons.star_rate),
                ],
              ),
            ),
          ),

          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            subtitle: Text("This is my home"),
            trailing: Expanded(
              child: Row(
                children: [
                  Text("5.0"),
                  SizedBox(width: 10),
                  Icon(Icons.star_rate),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            subtitle: Text("This is my home"),
            trailing: Expanded(
              child: Row(
                children: [
                  Text("5.0"),
                  SizedBox(width: 10),
                  Icon(Icons.star_rate),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
