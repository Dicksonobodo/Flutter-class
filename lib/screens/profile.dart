import 'package:first_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: CircleAvatar(
                          backgroundColor: Colors.brown,
                          backgroundImage: const AssetImage(''),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 150,
                      bottom: 7,
                      width: 50,
                      height: 50,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        backgroundImage: const AssetImage(''),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(2, 2)
                      )
                    ]
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.person, color: Colors.brown, size: 24,),
                      SizedBox(width: 12,),
                      TextButton(
                        style: TextButton.styleFrom(foregroundColor: Colors.brown),
                        onPressed: () {
                          // TODO: navigate to My Account screen
                        },
                        child: const Text('My Account', style: TextStyle(color: Colors.brown)),
                      ),
                      SizedBox(width: 240,),
                      Icon(Icons.chevron_right, color: Colors.blueGrey, size: 34,)
                    ],
                  ),
                ),
                SizedBox(height: 28),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(2, 2)
                      )
                    ]
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.notifications, color: Colors.brown, size: 24,),
                      SizedBox(width: 12,),
                      TextButton(
                        style: TextButton.styleFrom(foregroundColor: Colors.brown),
                        onPressed: () {
                          // TODO: navigate to Notifications
                        },
                        child: const Text('Notification', style: TextStyle(color: Colors.brown)),
                      ),
                      SizedBox(width: 240,),
                      Icon(Icons.chevron_right, color: Colors.blueGrey, size: 34,)
                    ],
                  ),
                ),
                SizedBox(height: 28),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(2, 2)
                      )
                    ]
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.settings, color: Colors.brown, size: 24,),
                      SizedBox(width: 12,),
                      TextButton(
                        style: TextButton.styleFrom(foregroundColor: Colors.brown),
                        onPressed: () {
                          // TODO: navigate to Settings
                        },
                        child: const Text('Settings', style: TextStyle(color: Colors.brown)),
                      ),
                      SizedBox(width: 260,),
                      Icon(Icons.chevron_right, color: Colors.blueGrey, size: 34,)
                    ],
                  ),
                ),
                SizedBox(height: 28),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(2, 2)
                      )
                    ]
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.help, color: Colors.brown, size: 24,),
                      SizedBox(width: 12,),
                      TextButton(
                        style: TextButton.styleFrom(foregroundColor: Colors.brown),
                        onPressed: () {
                          // TODO: navigate to Help
                        },
                        child: const Text('Help', style: TextStyle(color: Colors.brown)),
                      ),
                      SizedBox(width: 280,),
                      Icon(Icons.chevron_right, color: Colors.blueGrey, size: 34,)
                    ],
                  ),
                ),
                SizedBox(height: 28),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(2, 2)
                      )
                    ]
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.logout, color: Colors.brown, size: 24,),
                      SizedBox(width: 12,),
                      TextButton(
                        style: TextButton.styleFrom(foregroundColor: Colors.brown),
                        onPressed: () async {
                          // Handle logout logic
                          await AuthService().signOut();
                          Navigator.pushReplacementNamed(context, '/auth');

                        },
                        child: const Text('sign out', style: TextStyle(color: Colors.brown)),
                      ),
                      SizedBox(width: 260,),
                      Icon(Icons.chevron_right, color: Colors.blueGrey, size: 34,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
