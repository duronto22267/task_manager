import 'package:flutter/material.dart';
import 'package:task_management/ui/Screens/navScreens/cancelled_task.dart';
import 'package:task_management/ui/Screens/navScreens/completed_task.dart';
import 'package:task_management/ui/Screens/navScreens/progress_task_list.dart';
import 'package:task_management/ui/Screens/navScreens/update_profile_screens.dart';
import 'package:task_management/ui/Screens/new_task_list_screen.dart';
import 'package:task_management/ui/Screens/sign_in_screen.dart';
import 'package:task_management/ui/controller/auth_controllers.dart';

class MainBottomNavHolder extends StatefulWidget {
  const MainBottomNavHolder({super.key});

  static const String name = '/main-bottom-nav-holder';

  @override
  State<MainBottomNavHolder> createState() => _MainBottomNavHolderState();
}

class _MainBottomNavHolderState extends State<MainBottomNavHolder> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    NewTaskListScreen(),
    ProgressTaskList(),
    CancelledTaskListScreen(),
    CompleteTaskListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    //final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: TMappBar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          _selectedIndex = index;
          setState(() {});
        },

        destinations: [
          NavigationDestination(
            icon: Icon(Icons.new_label_outlined),
            label: 'new',
          ),
          NavigationDestination(
            icon: Icon(Icons.access_time),
            label: 'progress',
          ),
          NavigationDestination(
            icon: Icon(Icons.cancel_outlined),
            label: 'Cancelled',
          ),
          NavigationDestination(icon: Icon(Icons.done), label: 'completed'),
        ],
      ),
    );
  }
}

class TMappBar extends StatelessWidget implements PreferredSizeWidget {
  const TMappBar({super.key, this.updateProfile = false});
  final bool updateProfile;



 
  

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: Colors.green,
      title: GestureDetector(
        onTap: () {
          if(updateProfile){
            return;
          }
          Navigator.pushNamed(context, UpdateProfileScreens.name);
        },
        child: Row(
          spacing: 12,
          children: [
            CircleAvatar(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Afrin Babor',
                  style: textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
                Text(
                'durontozahir@gmail.comm',
                  style: textTheme.bodySmall?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => _onTapLogOutButton(context),
          icon: Icon(Icons.logout),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  void _onTapLogOutButton(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Logout'),
        content: const Text('আপনি কি নিশ্চয়ই লগআউট করতে চান?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), // বন্ধ করল
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {

              await AuthControllers.clearUserData();
              //set logic here
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logged out successfully')),
              );
              
              Navigator.pushNamedAndRemoveUntil(
                context,
                SignInScreen.name,
                (predicate) => false,
              );
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
