import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socio/Api/api.dart';
import 'package:socio/screens/auth/profile_screen.dart';
import 'package:socio/widgets/chat_usercard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  get list => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(CupertinoIcons.home),
          title: const Text('socio'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ProfileScreen(
                                user: list[16],
                              )));
                },
                icon: Icon(Icons.more_vert))
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: FloatingActionButton(
            onPressed: () async {
              await APIs.auth.signOut();
              await GoogleSignIn().signOut();
            },
            child: Icon(Icons.add_box_rounded),
          ),
        ),
        body: StreamBuilder(
          stream: APIs.firestore.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data?.docs;
              for (var i in data!) {
                log('Data: ${i.data()}' as num);
              }
            }
            return ListView.builder(
                itemCount: 16,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return const ChatUserCard();
                });
          },
        ));
  }
}
