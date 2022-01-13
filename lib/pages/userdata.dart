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
        body: Center(
            child: Container(
              decoration: BoxDecoration(
              color: Colors.white),
              child: Column(
      children: [
              Image.network('${profile}',
              width: 200,
              height: 200,),
              Divider(),
              Text('ID : ${user_id}'),
              Divider(),
              Text('User name : ${user_name}'),
              Divider(),
              Text('Follower : ${follower}'),
              Divider(),
              Text('Following : ${following}'),
              Divider(),
              Text('Role : ${role}'),
              Divider(),
              Text('Company : ${company}'),
              Divider(),
              Text('Contact : ${contact}')
        
        
      ],
    ),
            ),
          ),

    );
  }
}
