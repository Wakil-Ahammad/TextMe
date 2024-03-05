import 'package:flutter/material.dart';
import 'package:minimal_chat/components/my_drawer.dart';
import 'package:minimal_chat/components/user_tile.dart';
import 'package:minimal_chat/pages/chat_page.dart';
import 'package:minimal_chat/services/auth/auth_service.dart';
import 'package:minimal_chat/services/chat/chat_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  // void logout(){
  //   final auth = AuthService();
  //   auth.signOut();
  // }
  final _chatService = ChatService();
  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Min chat app'),
        actions: const [
          //logout button
          // IconButton(onPressed: logout, icon: const Icon(Icons.logout)),
        ],
      ),

      body: _buildUserList(),
      //drawer
      drawer: const MyDrawer(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chatService.getUserStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          }
          //loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }
          //return list view
          return ListView(
            children: snapshot.data!
                .map<Widget>(
                    (userData) => _buildUserListItem(userData, context))
                .toList(),
          );
        });
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    //display all user except current user
    if(userData['email']!=_authService.getCurrentUser()!.email){
      return UserTile(
      text: userData['email'],
      onTap: () {
        //tap on a user -> goto chatpage
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiveEmail: userData['email'],
                receiverId: userData['uid'],
              ),
            ));
      },
    );
    }
    else{
      return Container();
    }
  }
}
