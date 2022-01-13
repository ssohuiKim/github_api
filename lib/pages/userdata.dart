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
              child: ListView(
                children: [Column(
      children: [
                Text(' ', style: TextStyle(fontSize: 50)),
                Image.network('${profile}',
                width: 200,
                height: 200,),
                Text(' ', style: TextStyle(fontSize: 30)),
                Divider(),
                ListTile(leading: Icon(Icons.face),title: Text('ID : ${user_id}',style: TextStyle(fontSize: 18))),
                Divider(),
                ListTile(leading: Icon(Icons.face_retouching_natural), title: Text('User name : ${user_name}',style: TextStyle(fontSize: 17))),
                Divider(),
                ListTile(leading: Icon(Icons.thumb_up_alt_outlined), title: Text('Follower : ${follower}',style: TextStyle(fontSize: 17))),
                Divider(),
                ListTile(leading: Icon(Icons.remove_red_eye_rounded), title: Text('Following : ${following}',style: TextStyle(fontSize: 17))),
                Divider(),
                ListTile(leading: Icon(Icons.work), title: Text('Role : ${role}',style: TextStyle(fontSize: 17))),
                Divider(),
                ListTile(leading: Icon(Icons.place_rounded), title: Text('Company : ${company}',style: TextStyle(fontSize: 17))),
                Divider(),
                ListTile(leading: Icon(Icons.contact_mail_rounded), title: Text('Contact : ${contact}',style: TextStyle(fontSize: 17)))
      ],
    ),]
              ),
            ),
          ),
    );
  }
}
