import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async' show Future;
import 'package:flutter/services.dart';
import 'package:untitled/pages/userdata.dart';

String user_name = '';
dynamic profile = '';
dynamic follower = '';
dynamic following = '';

class UserNameInputField extends StatelessWidget {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (appBar: AppBar(title: Text('User Search'),centerTitle: true),
        body: Column(
          children: [
            Row(
      children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(70),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child:
                        TextField(
                          controller: _controller,
                          onChanged: (String value) async {
                              final response =
                              await http.get(Uri.parse('https://api.github.com/users/${value}'));
                              if (response.statusCode == 200) {
                                //print(response.body);
                                Map<String, dynamic> data = jsonDecode(response.body);
                                user_name = data['login'];
                                profile = data['avatar_url'];
                                follower = data['followers_url'];
                                following = data['following_url'];

                              } else{
                                throw Exception('Failed to load post');
                              }
                          },
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                            hintText: 'Search User Here',
                            contentPadding: EdgeInsets.all(12),
                          ),
                        ),
                  ),
                )),
      ],
    ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => userdata())
                );
              },
              child: Text('Search')
          ),
          ],
        ));

  }
}

class userdata extends StatefulWidget {
  const userdata({Key? key}) : super(key: key);

  @override
  _userdataState createState() => _userdataState();
}

class _userdataState extends State<userdata> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network('${profile}'),
        Text(
          '${user_name}',
          style: TextStyle(
              fontSize: 15,
              color: Colors.indigo,
          ),
        )
      ],
    );
  }
}
