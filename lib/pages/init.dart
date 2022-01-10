import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;


class UserNameInputField extends StatelessWidget {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (appBar: AppBar(title: Text('User Search'),centerTitle: true),
        body: Row(
      children: [
        Expanded(
            child: Padding(
              padding: const EdgeInsets.all(70),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextField(
                  controller: _controller,
                  onChanged: (String value) async {
                      final response =
                      await http.get(Uri.parse('https://api.github.com/users/${value}'));

                      if (response.statusCode == 200) {
                        print(response.body);
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
            ))
      ],
    ));
  }
}
