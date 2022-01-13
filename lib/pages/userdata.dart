import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled/pages/init.dart';

class userdata extends StatefulWidget {
  const userdata({Key? key}) : super(key: key);

  @override
  _userdataState createState() => _userdataState();
}

class _userdataState extends State<userdata> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Result'),centerTitle: true,),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
            color: Colors.white),
            child: Column(
      children: [
            Image.network('${profile}'),
            Text(
              '${user_name}',
              style: TextStyle(
                fontSize: 40,
                color: Colors.indigo,
              ),
            )
      ],
    ),
          ),
        )
    );
  }
}

