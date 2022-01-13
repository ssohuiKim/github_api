import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async' show Future;
import 'package:flutter/services.dart';
import 'package:untitled/pages/userdata.dart';

String user_name = '';
String user_id = '';
dynamic profile = '';
dynamic follower = '';
dynamic following = '';
String role = '';
String contact = '';
String company = '';

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
                                user_id = data['login'];
                                user_name = data['name'];
                                profile = data['avatar_url'];
                                follower = data['followers'];
                                following = data['following'];
                                role = data['bio'];
                                contact = data['email'];
                                company = data['company'];

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
